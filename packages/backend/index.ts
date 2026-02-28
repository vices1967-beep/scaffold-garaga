import { spawn } from 'child_process';
import { writeFileSync, existsSync, statSync } from 'fs';
import { join } from 'path';

// Rutas de los circuitos
const SELECTION_CIRCUIT_PATH = join(__dirname, 'circuits', 'selection', 'selection');
const PAYMENT_CIRCUIT_PATH = join(__dirname, 'circuits', 'payment'); // Nuevo circuito de pago

const MAX_BIDS = 8;

interface BidInput {
  amount: string;
  secret: string;
  winner: string;
  lot_id: string | number;
  commitment: string;
}

interface RequestBody {
  bids?: BidInput[];   // para selección
  bid?: BidInput;      // para pago
}

// Generador para el circuito de selección (existente)
function generarProverTomlSelection(bids: BidInput[]): string {
  const bidsArray = [];
  const validBids = [];
  const lotId = bids[0]?.lot_id || 0;

  for (let i = 0; i < MAX_BIDS; i++) {
    if (i < bids.length) {
      bidsArray.push({
        amount: bids[i].amount,
        nonce: bids[i].secret,
        bidder: bids[i].winner,
        lot_id: lotId,
      });
      validBids.push(true);
    } else {
      bidsArray.push({
        amount: 0,
        nonce: 0,
        bidder: '0x0',
        lot_id: lotId,
      });
      validBids.push(false);
    }
  }

  return `
bids = [
${bidsArray.map(b => `    { amount = ${b.amount}, nonce = ${b.nonce}, bidder = "${b.bidder}", lot_id = ${b.lot_id} }`).join(',\n')}
]
valid_bids = [${validBids.join(', ')}]
lot_id = ${lotId}
`;
}

// Nuevo generador para el circuito de pago (basado en el Prover.toml de ejemplo)
function generarProverTomlPayment(bid: BidInput): string {
  // El circuito espera: secret, amount_low, lot_id_low, winner
  // Nota: amount y lot_id se pasan como low (128 bits) – en el frontend ya se manejan así.
  return `
secret = ${bid.secret}
amount_low = ${bid.amount}
lot_id_low = ${bid.lot_id}
winner = "${bid.winner}"
`;
}

// Ejecutar un comando y devolver promesa
function execCommand(command: string, args: string[], cwd: string): Promise<void> {
  return new Promise((resolve, reject) => {
    const proc = spawn(command, args, { cwd, shell: true });
    let stderrOutput = '';
    proc.stdout.on('data', (data) => console.log(`[${command} stdout]: ${data.toString()}`));
    proc.stderr.on('data', (data) => {
      stderrOutput += data.toString();
      console.error(`[${command} stderr]: ${data.toString()}`);
    });
    proc.on('close', (code) => {
      if (code === 0) resolve();
      else reject(new Error(`Command ${command} failed with code ${code}. Stderr: ${stderrOutput}`));
    });
  });
}

// Ejecutar garaga y devolver stdout
function execGaraga(args: string[], cwd: string): Promise<string> {
  const garagaBin = join(__dirname, 'garaga-venv', 'bin', 'garaga');
  return new Promise((resolve, reject) => {
    const proc = spawn(garagaBin, args, { cwd });
    let stdout = '';
    let stderr = '';
    proc.stdout.on('data', (data) => { stdout += data.toString(); });
    proc.stderr.on('data', (data) => { stderr += data.toString(); });
    proc.on('close', (code) => {
      if (code === 0) resolve(stdout);
      else reject(new Error(`Garaga failed (code ${code}): ${stderr}`));
    });
  });
}

const ALLOWED_ORIGINS = [
  'http://localhost:3000',
  'http://192.168.100.3:3000',
  'https://zk-sealed-cattle.vercel.app',
];

function corsHeaders(request: Request): Record<string, string> {
  const origin = request.headers.get('Origin');
  if (origin && ALLOWED_ORIGINS.includes(origin)) {
    return {
      'Access-Control-Allow-Origin': origin,
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    };
  }
  return {
    'Access-Control-Allow-Origin': ALLOWED_ORIGINS[0],
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
}

export default {
  port: parseInt(process.env.PORT || '3001'),
  async fetch(request: Request) {
    const headers = corsHeaders(request);
    const url = new URL(request.url);

    // Health check para Railway (GET /)
    if (request.method === 'GET' && url.pathname === '/') {
      return new Response('OK', { status: 200, headers });
    }

    if (request.method === 'OPTIONS') {
      return new Response(null, { status: 204, headers });
    }

    if (request.method !== 'POST') {
      return new Response('Method not allowed', { status: 405, headers });
    }

    try {
      const body = await request.json() as RequestBody;

      // Endpoint de selección (existente)
      if (url.pathname === '/api/zk-proof' || url.pathname === '/api/zk-proof/') {
        const { bids } = body;
        if (!Array.isArray(bids) || bids.length === 0) {
          return new Response('Invalid bids', { status: 400, headers });
        }

        // Escribir Prover.toml
        const proverContent = generarProverTomlSelection(bids);
        const proverPath = join(SELECTION_CIRCUIT_PATH, 'Prover.toml');
        writeFileSync(proverPath, proverContent);
        console.log('Prover.toml (selection) generado:\n', proverContent);

        // Compilar circuito
        await execCommand('nargo', ['compile'], SELECTION_CIRCUIT_PATH);

        // Ejecutar witness con reintento
        let witnessOk = false;
        const witnessPath = join(SELECTION_CIRCUIT_PATH, 'target', 'witness.gz');
        for (let attempt = 1; attempt <= 2; attempt++) {
          await execCommand('nargo', ['execute', 'witness'], SELECTION_CIRCUIT_PATH);
          await new Promise(resolve => setTimeout(resolve, 2000));
          if (existsSync(witnessPath)) {
            const stats = statSync(witnessPath);
            console.log(`Witness size (attempt ${attempt}): ${stats.size} bytes`);
            if (stats.size > 0) {
              witnessOk = true;
              break;
            }
          }
          console.log(`Witness vacío, reintentando...`);
        }
        if (!witnessOk) {
          throw new Error('No se pudo generar el witness después de 2 intentos');
        }

        // Comandos de bb
        await execCommand('bb', ['prove_ultra_keccak_honk', '-b', './target/selection.json', '-w', './target/witness.gz', '-o', './target/proof'], SELECTION_CIRCUIT_PATH);
        await execCommand('bb', ['write_vk_ultra_keccak_honk', '-b', './target/selection.json', '-o', './target/vk'], SELECTION_CIRCUIT_PATH);
        await execCommand('bb', ['proof_as_fields_honk', '-k', './target/vk', '-p', './target/proof', '-o', './target/public_inputs'], SELECTION_CIRCUIT_PATH);

        // Verificar archivos
        const requiredFiles = ['vk', 'proof', 'public_inputs'].map(f => join(SELECTION_CIRCUIT_PATH, 'target', f));
        for (const file of requiredFiles) {
          if (!existsSync(file)) {
            throw new Error(`Archivo faltante: ${file}`);
          }
        }

        // Generar calldata con Garaga
        const garagaArgs = [
          'calldata',
          '--system', 'ultra_keccak_honk',
          '--vk', './target/vk',
          '--proof', './target/proof',
          '--public-inputs', './target/public_inputs',
          '--format', 'starkli'
        ];
        const garagaOutput = await execGaraga(garagaArgs, SELECTION_CIRCUIT_PATH);
        const calldata = garagaOutput.trim().split(/\s+/);

        return new Response(JSON.stringify({ calldata }), {
          headers: { 'Content-Type': 'application/json', ...headers },
        });
      }

      // Nuevo endpoint de pago
      else if (url.pathname === '/api/zk-payment' || url.pathname === '/api/zk-payment/') {
        const { bid } = body;
        if (!bid) {
          return new Response('Missing bid', { status: 400, headers });
        }

        // Escribir Prover.toml para pago
        const proverContent = generarProverTomlPayment(bid);
        const proverPath = join(PAYMENT_CIRCUIT_PATH, 'Prover.toml');
        writeFileSync(proverPath, proverContent);
        console.log('Prover.toml (payment) generado:\n', proverContent);

        // Compilar circuito (por si no está compilado)
        await execCommand('nargo', ['compile'], PAYMENT_CIRCUIT_PATH);

        // Ejecutar witness
        const witnessPath = join(PAYMENT_CIRCUIT_PATH, 'target', 'witness.gz');
        await execCommand('nargo', ['execute', 'witness'], PAYMENT_CIRCUIT_PATH);
        // Esperar un poco para asegurar escritura
        await new Promise(resolve => setTimeout(resolve, 2000));
        if (!existsSync(witnessPath) || statSync(witnessPath).size === 0) {
          throw new Error('Failed to generate witness');
        }

        // Comandos de bb (usamos el nombre del proyecto: payment.json)
        const circuitJson = join(PAYMENT_CIRCUIT_PATH, 'target', 'payment.json');
        // Verificar que existe el archivo JSON compilado
        if (!existsSync(circuitJson)) {
          throw new Error(`Compiled circuit JSON not found: ${circuitJson}`);
        }

        await execCommand('bb', ['prove_ultra_keccak_honk', '-b', circuitJson, '-w', witnessPath, '-o', './target/proof'], PAYMENT_CIRCUIT_PATH);
        await execCommand('bb', ['write_vk_ultra_keccak_honk', '-b', circuitJson, '-o', './target/vk'], PAYMENT_CIRCUIT_PATH);
        await execCommand('bb', ['proof_as_fields_honk', '-k', './target/vk', '-p', './target/proof', '-o', './target/public_inputs'], PAYMENT_CIRCUIT_PATH);

        // Verificar archivos generados
        const requiredFiles = ['vk', 'proof', 'public_inputs'].map(f => join(PAYMENT_CIRCUIT_PATH, 'target', f));
        for (const file of requiredFiles) {
          if (!existsSync(file)) {
            throw new Error(`Missing file: ${file}`);
          }
        }

        // Generar calldata con Garaga
        const garagaArgs = [
          'calldata',
          '--system', 'ultra_keccak_honk',
          '--vk', './target/vk',
          '--proof', './target/proof',
          '--public-inputs', './target/public_inputs',
          '--format', 'starkli'
        ];
        const garagaOutput = await execGaraga(garagaArgs, PAYMENT_CIRCUIT_PATH);
        const calldata = garagaOutput.trim().split(/\s+/);

        return new Response(JSON.stringify({ calldata }), {
          headers: { 'Content-Type': 'application/json', ...headers },
        });
      }

      // Ruta no encontrada
      else {
        return new Response('Not found', { status: 404, headers });
      }
    } catch (error: any) {
      console.error('Error en backend:', error);
      return new Response(`Internal server error: ${error.message}`, {
        status: 500,
        headers,
      });
    }
  },
};
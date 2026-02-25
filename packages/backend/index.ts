import { spawn } from 'child_process';
import { writeFileSync, existsSync, statSync } from 'fs';
import { join } from 'path';

const CIRCUITS_PATH = join(__dirname, 'circuits', 'selection', 'selection');
const MAX_BIDS = 8;

interface BidInput {
  amount: string;
  secret: string;
  winner: string;
  lot_id: string | number;
  commitment: string;
}

interface RequestBody {
  bids: BidInput[];
}

function generarProverToml(bids: BidInput[]): string {
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

    // Health check para Railway (GET /)
    if (request.method === 'GET') {
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
      const { bids } = body;

      if (!Array.isArray(bids) || bids.length === 0) {
        return new Response('Invalid bids', { status: 400, headers });
      }

      // Escribir Prover.toml
      const proverContent = generarProverToml(bids);
      const proverPath = join(CIRCUITS_PATH, 'Prover.toml');
      writeFileSync(proverPath, proverContent);
      console.log('Prover.toml generado:\n', proverContent);

      // Compilar circuito
      await execCommand('nargo', ['compile'], CIRCUITS_PATH);

      // Ejecutar witness con reintento
      let witnessOk = false;
      const witnessPath = join(CIRCUITS_PATH, 'target', 'witness.gz');
      for (let attempt = 1; attempt <= 2; attempt++) {
        await execCommand('nargo', ['execute', 'witness'], CIRCUITS_PATH);
        await new Promise(resolve => setTimeout(resolve, 2000)); // Esperar escritura
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
      await execCommand('bb', ['prove_ultra_keccak_honk', '-b', './target/selection.json', '-w', './target/witness.gz', '-o', './target/proof'], CIRCUITS_PATH);
      await execCommand('bb', ['write_vk_ultra_keccak_honk', '-b', './target/selection.json', '-o', './target/vk'], CIRCUITS_PATH);
      await execCommand('bb', ['proof_as_fields_honk', '-k', './target/vk', '-p', './target/proof', '-o', './target/public_inputs'], CIRCUITS_PATH);

      // Verificar archivos
      const requiredFiles = ['vk', 'proof', 'public_inputs'].map(f => join(CIRCUITS_PATH, 'target', f));
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
      const garagaOutput = await execGaraga(garagaArgs, CIRCUITS_PATH);
      const calldata = garagaOutput.trim().split(/\s+/);

      return new Response(JSON.stringify({ calldata }), {
        headers: { 'Content-Type': 'application/json', ...headers },
      });
    } catch (error: any) {
      console.error('Error en backend:', error);
      return new Response(`Internal server error: ${error.message}`, {
        status: 500,
        headers,
      });
    }
  },
};
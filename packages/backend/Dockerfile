FROM oven/bun:latest

WORKDIR /app

# Instala Python 3.10 específicamente y otras utilidades
RUN apt-get update && apt-get install -y python3.10 python3.10-venv python3.10-dev curl unzip bash git && \
    rm -rf /var/lib/apt/lists/*

# Asegura que python3.10 sea el predeterminado para los comandos python3 (opcional, pero consistente)
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Instala noirup y nargo (versión 1.0.0-beta.1)
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:$PATH"
RUN noirup --version 1.0.0-beta.1

# Instala bbup y bb
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
# Busca bbup y ejecuta para instalar bb 0.67.0
RUN BBUP_PATH=$(find /root -name bbup -type f) && \
    echo "Encontrado bbup en: $BBUP_PATH" && \
    $BBUP_PATH --version 0.67.0
# Busca el binario bb y crea enlace simbólico en /usr/local/bin
RUN BB_PATH=$(find /root -name bb -type f) && \
    if [ -n "$BB_PATH" ]; then \
        echo "Encontrado bb en: $BB_PATH" && \
        ln -s $BB_PATH /usr/local/bin/bb; \
    else \
        echo "ERROR: no se encontró el binario bb" && exit 1; \
    fi

# Crea entorno virtual con Python 3.10
RUN python3.10 -m venv /app/garaga-venv
ENV PATH="/app/garaga-venv/bin:$PATH"

# Instala Garaga con pip (ahora compatible con Python 3.10)
RUN pip install garaga

# Copia los archivos de dependencias de Node
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copia el resto del código (circuitos, src, etc.)
COPY . .

EXPOSE 3001
CMD ["bun", "run", "src/index.ts"]
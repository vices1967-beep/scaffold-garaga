FROM oven/bun:latest

WORKDIR /app

# Instala Python, pip, curl, unzip, bash, git y otras utilidades
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv curl unzip bash git && \
    rm -rf /var/lib/apt/lists/*

# Instala noirup y nargo (versión 1.0.0-beta.1)
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:$PATH"
RUN noirup --version 1.0.0-beta.1

# Instala bbup (gestor de versiones de Barretenberg)
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
# Busca el ejecutable bbup (suele estar en /root/.bbup/bin/bbup) y ejecútalo para instalar bb 0.67.0
RUN BBUP_PATH=$(find /root -name bbup -type f) && \
    echo "Encontrado bbup en: $BBUP_PATH" && \
    $BBUP_PATH --version 0.67.0

# Después de instalar bb, busca el binario 'bb' y créale un enlace simbólico en /usr/local/bin
RUN BB_PATH=$(find /root -name bb -type f) && \
    if [ -n "$BB_PATH" ]; then \
        echo "Encontrado bb en: $BB_PATH" && \
        ln -s $BB_PATH /usr/local/bin/bb; \
    else \
        echo "ERROR: no se encontró el binario bb" && exit 1; \
    fi

# Crea entorno virtual para Garaga
RUN python3 -m venv /app/garaga-venv
ENV PATH="/app/garaga-venv/bin:$PATH"

# Instala Garaga con pip
RUN pip install garaga

# Copia los archivos de dependencias de Node
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copia el resto del código (circuitos, src, etc.)
COPY . .

EXPOSE 3001
CMD ["bun", "run", "src/index.ts"]
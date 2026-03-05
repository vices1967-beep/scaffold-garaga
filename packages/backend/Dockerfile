FROM oven/bun:latest

WORKDIR /app

# Instala Python, pip, curl y otras utilidades (incluyendo bash)
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv curl unzip bash && \
    rm -rf /var/lib/apt/lists/*

# Instala noirup y nargo (versión 1.0.0-beta.1)
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:$PATH"
RUN /bin/bash -c "source /root/.bashrc && noirup --version 1.0.0-beta.1"

# Instala bbup y bb (versión 0.67.0)
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
ENV PATH="/root/.bb:$PATH"
RUN /bin/bash -c "source /root/.bashrc && bbup --version 0.67.0"

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
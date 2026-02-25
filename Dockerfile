FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. Dependencias base del sistema
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libc++-dev \
    libc++abi-dev \
    unzip \
    wget \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# 2. Python 3.10 (necesario para Garaga)
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Instalación de Bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# 4. Instalación de nargo (Noir) v1.0.0-beta.1
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:${PATH}"
RUN noirup --version 1.0.0-beta.1

# 5. Instalación de bb (Barretenberg) v0.67.0
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
ENV PATH="/root/.bb:${PATH}"
RUN bbup --version 0.67.0

# 6. Instalación de Garaga v0.15.5 (sin verificación de versión)
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
RUN pip install --upgrade pip && \
    pip install garaga==0.15.5

# 7. Configuración del backend Bun
WORKDIR /app
COPY packages/backend/package.json packages/backend/bun.lock* ./
RUN bun install
COPY packages/backend/ .

# 8. Puerto y comando de inicio (usa el puerto de Railway)
EXPOSE 3001
CMD ["bun", "run", "index.ts"]
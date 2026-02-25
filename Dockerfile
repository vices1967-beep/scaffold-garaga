FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalación de dependencias base del sistema
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libc++-dev \
    libc++abi-dev \
    unzip \
    wget \
    jq \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Instalación de Python 3.10 (necesario para Garaga)
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalación de Bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# Instalación de nargo (Noir) v1.0.0-beta.1 usando noirup
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:${PATH}"
RUN noirup --version 1.0.0-beta.1 && nargo --version

# Instalación de bb (Barretenberg) v0.67.0 usando bbup
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
ENV PATH="/root/.bb:${PATH}"
RUN bbup --version 0.67.0 && bb --version

# Instalación de Garaga v0.15.5
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
RUN pip install --upgrade pip && \
    pip install garaga==0.15.5 && \
    garaga --version

# Configuración del backend Bun
WORKDIR /app
COPY packages/backend/package.json packages/backend/bun.lock* ./
RUN bun install
COPY packages/backend/ .

# Exponer el puerto (Railway usará la variable PORT)
EXPOSE 3001
CMD ["bun", "run", "index.ts"]
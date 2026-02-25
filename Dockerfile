FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libc++-dev \
    libc++abi-dev \
    unzip \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# Instalar noirup y nargo (versión 1.0.0-beta.1)
RUN curl -L https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:${PATH}"
RUN noirup --version 1.0.0-beta.1

# Instalar bbup y barretenberg (versión 0.67.0)
RUN curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
ENV PATH="/root/.bb:${PATH}"
RUN bbup --version 0.67.0

# Instalar Garaga (Python 3.10)
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
RUN pip install garaga

WORKDIR /app
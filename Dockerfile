FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# ============================================
# 1. Dependencias base del sistema
# ============================================
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

# ============================================
# 2. Python 3.10 (necesario para Garaga)
# ============================================
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# 3. Instalación de Bun
# ============================================
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# ============================================
# 4. Instalación de nargo (Noir) v1.0.0-beta.1
#    Usando el script espejo de GitHub
# ============================================
# Instalar noirup
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
# Añadir noirup al PATH
ENV PATH="/root/.nargo/bin:${PATH}"
# Instalar la versión específica de nargo
RUN noirup --version 1.0.0-beta.1

# ============================================
# 5. Instalación de bb (Barretenberg) v0.67.0
#    Usando el script espejo de GitHub
# ============================================
# Instalar bbup
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
# Añadir bbup al PATH (se instala en /root/.bb/)
ENV PATH="/root/.bb:${PATH}"
# Instalar la versión específica de bb
RUN bbup --version 0.67.0

# ============================================
# 6. Instalación de Garaga v0.15.5
# ============================================
# Crear entorno virtual
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
# Instalar Garaga
RUN pip install --upgrade pip && \
    pip install garaga==0.15.5

# ============================================
# 7. Configuración del backend Bun
# ============================================
WORKDIR /app

# Copiar archivos de dependencias
COPY packages/backend/package.json packages/backend/bun.lock* ./
RUN bun install

# Copiar el resto del código del backend
COPY packages/backend/ .

# ============================================
# 8. Puerto y comando de inicio
# ============================================
EXPOSE 3001
CMD ["bun", "run", "index.ts"]
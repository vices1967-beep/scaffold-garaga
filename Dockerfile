FROM ubuntu:22.04

# Evita preguntas interactivas durante la instalación de paquetes
ENV DEBIAN_FRONTEND=noninteractive

# ============================================
# Instalación de dependencias base del sistema
# ============================================
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libc++-dev \
    libc++abi-dev \
    unzip \
    wget \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# Instalación de Bun
# ============================================
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# ============================================
# Instalación de nargo (Noir) v1.0.0-beta.1
# ============================================
RUN curl -L https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
ENV PATH="/root/.nargo/bin:${PATH}"
RUN /root/.nargo/bin/noirup -v 1.0.0-beta.1

# ============================================
# Instalación de bb (Barretenberg) v0.67.0 (descarga directa)
# ============================================
WORKDIR /tmp
RUN wget https://github.com/AztecProtocol/aztec-packages/releases/download/bb-0.67.0/bb-0.67.0-linux-amd64.tar.gz \
    && tar -xzf bb-0.67.0-linux-amd64.tar.gz \
    && mv bb /usr/local/bin/bb \
    && chmod +x /usr/local/bin/bb \
    && rm bb-0.67.0-linux-amd64.tar.gz
WORKDIR /app

# ============================================
# Instalación de Garaga (Python 3.10) v0.15.5
# ============================================
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
RUN pip install --upgrade pip
RUN pip install garaga==0.15.5

# ============================================
# Configuración del backend Bun
# ============================================
WORKDIR /app

# Copia los archivos de dependencias del backend (desde packages/backend)
COPY packages/backend/package.json packages/backend/bun.lock* ./
RUN bun install

# Copia el resto del código del backend
COPY packages/backend/ .

# ============================================
# Configuración del puerto y comando de inicio
# ============================================
EXPOSE 3001
CMD ["bun", "run", "index.ts"]
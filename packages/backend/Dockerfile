# Usa imagen oficial de Bun
FROM oven/bun:latest

WORKDIR /app

# Instala Python, pip, curl y otras utilidades
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Instala Noir (nargo) - versión 1.0.0-beta.1 (ajusta si es otra)
RUN curl -L https://github.com/noir-lang/noir/releases/download/v1.0.0-beta.1/nargo-x86_64-unknown-linux-gnu.tar.gz | tar xz -C /usr/local/bin && \
    mv /usr/local/bin/nargo-x86_64-unknown-linux-gnu /usr/local/bin/nargo

# Instala Barretenberg (bb) - versión 0.67.0 (ajusta si es otra)
RUN curl -L https://github.com/AztecProtocol/barretenberg/releases/download/v0.67.0/bb-x86_64-linux.tar.gz | tar xz -C /usr/local/bin && \
    mv /usr/local/bin/bb-x86_64-linux /usr/local/bin/bb

# Crea entorno virtual para Garaga
RUN python3 -m venv /app/garaga-venv
ENV PATH="/app/garaga-venv/bin:$PATH"

# Instala Garaga con pip (según el código, se espera en el venv)
RUN pip install garaga

# Copia los archivos de dependencias de Node
COPY package.json bun.lock ./
# Instala dependencias de Node con Bun (usando lockfile para reproducibilidad)
RUN bun install --frozen-lockfile

# Copia el resto del código (circuitos, src, etc.)
COPY . .

# Expone el puerto (Render asignará dinámicamente)
EXPOSE 3001

# Comando para iniciar el servidor
CMD ["bun", "run", "src/index.ts"]

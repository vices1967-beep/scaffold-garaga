FROM oven/bun:latest

WORKDIR /app

# Instala Python, pip, curl, unzip, bash, git y otras utilidades
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv curl unzip bash git && \
    rm -rf /var/lib/apt/lists/*

# Instala noirup (se instalará en /root/.nargo/bin/noirup)
RUN curl -fsSL https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
# Añade el directorio de noirup al PATH
ENV PATH="/root/.nargo/bin:$PATH"
# Ejecuta noirup para instalar nargo versión 1.0.0-beta.1
RUN noirup --version 1.0.0-beta.1

# Instala bbup (se instalará en /root/.bbup/bin/bbup)
RUN curl -fsSL https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
# Añade el directorio de bbup al PATH (ruta corregida)
ENV PATH="/root/.bbup/bin:$PATH"
# Ejecuta bbup para instalar bb versión 0.67.0
RUN bbup --version 0.67.0

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
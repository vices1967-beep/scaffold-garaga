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
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# Instalación de Bun
# ============================================
RUN curl -fsSL https://bun.sh/install | bash
# Añade Bun al PATH de forma permanente
ENV PATH="/root/.bun/bin:${PATH}"

# ============================================
# Instalación de nargo (Noir) v1.0.0-beta.1
# ============================================
RUN curl -L https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
# Añade noirup al PATH (se instala en /root/.nargo/bin)
ENV PATH="/root/.nargo/bin:${PATH}"
# Nota: la sintaxis correcta de noirup es: noirup -v <version>
RUN /root/.nargo/bin/noirup -v 1.0.0-beta.1

# ============================================
# Instalación de bb (Barretenberg) v0.67.0
# ============================================
# El script bbup se instala en /root/.bb/bbup
RUN curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/master/barretenberg/bbup/install | bash
# Añade el directorio ~/.bb al PATH para que bbup sea accesible
ENV PATH="/root/.bb:${PATH}"
# La sintaxis correcta de bbup para instalar una versión es: bbup <version>
# Nota: bbup descarga el binario 'bb' y lo coloca en /root/.bb/
RUN /root/.bb/bbup 0.67.0

# ============================================
# Instalación de Garaga (Python 3.10) v0.15.5
# ============================================
# Crear y activar el entorno virtual de Garaga
RUN python3.10 -m venv /garaga-venv
ENV PATH="/garaga-venv/bin:${PATH}"
# Asegurar que pip está actualizado
RUN pip install --upgrade pip
# Instalar la versión exacta de Garaga que ha funcionado
RUN pip install garaga==0.15.5

# ============================================
# Configuración del backend Bun
# ============================================
# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de dependencias del backend (desde packages/backend)
COPY packages/backend/package.json packages/backend/bun.lock* ./

# Instala las dependencias de Bun
RUN bun install

# Copia el resto del código del backend
COPY packages/backend/ .

# ============================================
# Configuración del puerto y comando de inicio
# ============================================
# Render asignará el puerto automáticamente a través de la variable de entorno $PORT.
# Tu aplicación debe escuchar en ese puerto.
EXPOSE 3001
# El comando de inicio ejecuta el servidor Bun
CMD ["bun", "run", "index.ts"]
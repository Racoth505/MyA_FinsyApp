# --- ETAPA 1: Construcción (Build) ---
FROM python:3.9-slim AS builder

# Evita que Python genere archivos .pyc y permite logs en tiempo real
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Instalamos dependencias de compilación si fueran necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copiamos e instalamos dependencias en un directorio de usuario para portabilidad
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt


# --- ETAPA 2: Ejecución (Runtime) ---
FROM python:3.9-slim

WORKDIR /app

# Definimos variables de entorno para que el sistema encuentre las librerías instaladas
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Copiamos solo las dependencias instaladas desde la etapa anterior
COPY --from=builder /root/.local /root/.local

# Copiamos el código fuente de la aplicación
COPY . .

# Exponemos el puerto que usa Flask (por defecto 5000)
EXPOSE 5000

# Comando para iniciar la aplicación
CMD ["python", "app.py"]
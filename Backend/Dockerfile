# Usamos una versión ligera de Node.js
FROM node:18-alpine

# Definimos el directorio de trabajo
WORKDIR /app

# Copiamos solo los archivos de dependencias primero para aprovechar el caché de Docker
COPY package*.json ./

# Instalamos solo las dependencias necesarias para producción
RUN npm install --omit=dev && npm cache clean --force

# Copiamos el resto del código fuente
COPY . .

# Exponemos el puerto de Express
EXPOSE 5000

# Usamos node directamente para mayor eficiencia en contenedores
CMD ["node", "server.js"]
FROM node:18-alpine

WORKDIR /app

# Copiamos archivos de dependencias
COPY package*.json ./

# Instalamos dependencias
RUN npm install

# Copiamos el código fuente del backend
COPY . .

# El puerto que suele usar Express
EXPOSE 5000

CMD ["npm", "start"]
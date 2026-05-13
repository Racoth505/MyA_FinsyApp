# --- ETAPA 1: Construcción (Build) ---
FROM node:18-alpine AS build-stage
WORKDIR /app
ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
COPY package*.json ./
RUN npm install
COPY . .
# Construimos la aplicación para producción
RUN npm run build

# --- ETAPA 2: Producción con Nginx ---
FROM nginx:stable-alpine
# Copiamos los archivos generados. 
# IMPORTANTE: Verifica si tu proyecto genera la carpeta 'dist' o 'build'
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copiamos una configuración de Nginx si la tuvieras (opcional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

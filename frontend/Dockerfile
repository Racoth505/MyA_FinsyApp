# Etapa de construcción
FROM node:18-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Generamos los archivos de producción si usas React/Vue/Vite
RUN npm run build

# Etapa de producción con Nginx
FROM nginx:stable-alpine
# Copiamos los archivos construidos a la carpeta de Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
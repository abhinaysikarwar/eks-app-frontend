FROM node:20-alpine As builder

WORKDIR /app

copy package*.json ./


RUN npm ci

copy . .

Run npm run build

FROM nginx:alpine


copy --from=builder /app/dist /usr/share/nginx/html

Expose 80

cmd ["nginx", "-g", "daemon off;"]
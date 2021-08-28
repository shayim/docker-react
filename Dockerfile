FROM node:14-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.21-alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


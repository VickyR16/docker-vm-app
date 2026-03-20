FROM alpine:latest
WORKDIR /app
COPY package*.json index.js .
EXPOSE 3000
RUN apk add npm nodejs
RUN npm ci
CMD ["npm","run","start"]

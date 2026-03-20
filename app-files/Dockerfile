FROM alpine:latest
WORKDIR /app
COPY package*.json .
EXPOSE 3000
RUN apk add npm nodejs
RUN npm ci
CMD ["npm","run","start"]

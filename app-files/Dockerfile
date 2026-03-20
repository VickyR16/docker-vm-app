FROM alpine:latest
WORKDIR /app
COPY package.*.json .
EXPOSE 3000
RUN apk add node.js express.js
CMD ["npm","start"]

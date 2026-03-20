FROM alpine:latest
WORKDIR /app
COPY package.*.json .
RUN apk add nodejs expressjs
CMD ["npm","start"]

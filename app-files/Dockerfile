FROM alpine:latest
WORKDIR /app
COPY package.*.json .
EXPOSE 3000
RUN apk add nodejs expressjs
CMD ["npm","start"]

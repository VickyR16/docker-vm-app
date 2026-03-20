FROM alpine:latest
WORKDIR /app
COPY package.*.json .
EXPOSE 3000
RUN npm ci
CMD ["npm","start"]

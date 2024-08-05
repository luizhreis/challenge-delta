FROM node:20 AS build-env

WORKDIR /app

COPY package.json ./

RUN npm i --package-lock-only \
    && npm ci --omit=dev

COPY . .

FROM gcr.io/distroless/nodejs22-debian12:latest-amd64

COPY --from=build-env /app /app

WORKDIR /app

USER 1511:1511

CMD ["./bin/www"]
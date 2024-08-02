FROM gcr.io/distroless/nodejs22-debian12:latest-amd64

FROM node:20 AS build-env

COPY . /app

WORKDIR /app

RUN npm i --package-lock-only

RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs22-debian12:latest-amd64

COPY --from=build-env /app /app

WORKDIR /app

CMD ["./bin/www"]
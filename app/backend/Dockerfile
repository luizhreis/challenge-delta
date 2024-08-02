FROM golang:1.20-alpine AS golang

ADD . /go/src/api

WORKDIR /go/src/api

RUN go mod download

RUN go mod verify

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/app

FROM gcr.io/distroless/static-debian12:latest-amd64

COPY --from=golang /go/bin/app /api

EXPOSE 3000

CMD [ "/api" ]
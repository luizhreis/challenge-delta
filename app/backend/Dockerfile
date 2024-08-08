FROM golang:1.20-alpine AS golang

WORKDIR /go/src/api

ADD go.mod ./

RUN go mod download \
    && go mod verify

ADD . . 

RUN go mod tidy \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/app

FROM gcr.io/distroless/static-debian12:latest-amd64

COPY --from=golang /go/bin/app /api

EXPOSE 3000

USER 1511:1511

CMD [ "/api" ]
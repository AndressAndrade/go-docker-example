FROM golang:alpine AS builder

WORKDIR /go/src

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -ldflags='-w -s -extldflags "-static"' -a \
    -o /go/src/exemplo .

FROM scratch 

WORKDIR /go/src

COPY --from=builder /go/src/exemplo .

CMD ["./exemplo"]
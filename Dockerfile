FROM golang:alpine

WORKDIR /go/src

COPY . .

RUN GOOS=linux go build exemplo.go

FROM scratch 

WORKDIR /go/src

COPY ./exemplo ./exemplo

CMD ["./exemplo"]
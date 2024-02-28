FROM golang:1.22.0-alpine AS builder

WORKDIR /app
COPY go.mod main.go .
RUN go build -o /bin/server .

ENV SERVER_BIND_ADDR ":8000"
ENTRYPOINT [ "/bin/server" ]
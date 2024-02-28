FROM golang:1.22.0-alpine AS builder

WORKDIR /app
COPY go.mod main.go .
RUN CGO_ENABLED=0 go build -o /bin/server .

FROM scratch
COPY --from=builder /bin/server /server

ENV SERVER_BIND_ADDR ":8000"
ENTRYPOINT [ "/server" ]
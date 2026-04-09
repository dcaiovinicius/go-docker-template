FROM golang:1.25.0-alpine AS builder

WORKDIR /api

RUN apk add --no-cache git

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o build/server ./cmd/server

FROM alpine:latest

WORKDIR /srv/server

COPY --from=builder /api/build/server .

EXPOSE 8080

CMD ["./server"]
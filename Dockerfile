# Passo 1: Construindo o binário
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go build -o main main.go

# Passo 2: Imagem com menos de 2 MB
FROM scratch
COPY --from=builder /app/main .
CMD ["./main"]

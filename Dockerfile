# Build the application from source
FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags '-s -w' main.go

# Deploy the application binary into a lean image

FROM scratch

WORKDIR /

COPY --from=builder /app /

CMD ["./main"]
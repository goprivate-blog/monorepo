FROM golang:1.18-buster AS builder

WORKDIR /src
COPY authorizer/ .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /authorizer cmd/authorizer/main.go

FROM alpine:3.15.0
COPY --from=builder /authorizer /authorizer
CMD ["/authorizer"]

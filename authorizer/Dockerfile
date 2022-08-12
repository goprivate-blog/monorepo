# syntax=docker/dockerfile:1
FROM golang:1.18-buster AS builder

WORKDIR /src
COPY authorizer/ .

RUN --mount=type=secret,id=ssh-script,dst=/root/go_mod_ssh_config.sh \
    --mount=type=secret,id=log-key,dst=/root/.ssh/log.pub \
    --mount=type=secret,id=server-key,dst=/root/.ssh/server.pub \
    --mount=type=ssh <<-EOF
    bash /root/go_mod_ssh_config.sh
    go mod download
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /authorizer cmd/authorizer/main.go
EOF

FROM alpine:3.15.0
COPY --from=builder /authorizer /authorizer
CMD ["/authorizer"]

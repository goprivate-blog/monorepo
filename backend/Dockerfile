# syntax=docker/dockerfile:1
FROM golang:1.18-buster AS builder

WORKDIR /src
COPY backend/ .

RUN --mount=type=secret,id=ssh-script,dst=/root/go_mod_ssh_config.sh \
    --mount=type=secret,id=log-key,dst=/root/.ssh/log \
    --mount=type=secret,id=server-key,dst=/root/.ssh/server \
    --mount=type=ssh <<-EOF
    bash /root/go_mod_ssh_config.sh
    go mod download
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /backend cmd/backend/main.go
EOF

FROM alpine:3.15.0
COPY --from=builder /backend /backend
CMD ["/backend"]

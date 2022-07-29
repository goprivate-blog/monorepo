FROM golang:1.18-buster AS builder

WORKDIR /src
COPY backend/ .

RUN git config --global url.ssh://git@github.com/.insteadOf https://github.com/
RUN mkdir /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts
ENV GOPRIVATE github.com/goprivate-blog

RUN --mount=type=ssh go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /backend cmd/backend/main.go

FROM alpine:3.15.0
COPY --from=builder /backend /backend
CMD ["/backend"]

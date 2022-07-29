package app

import (
	"context"

	"example.org/log"
	"example.org/server"
)

type App struct {
	logger *log.Logger
	server *server.Server
}

func NewApp(logger *log.Logger) *App {
	return &App{
		logger: logger,
		server: server.NewServer(),
	}
}

func (a *App) Start(ctx context.Context) error {
	a.logger.Info("Starting app")
	return a.server.Start()
}

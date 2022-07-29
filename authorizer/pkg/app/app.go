package app

import (
	"context"

	"example.org/log"
)

type App struct {
	logger *log.Logger
}

func NewApp(logger *log.Logger) *App {
	return &App{
		logger: logger,
	}
}

func (a *App) Start(ctx context.Context) error {
	a.logger.Info("Starting app")
	return nil
}

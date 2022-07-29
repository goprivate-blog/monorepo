package main

import (
	"context"

	"example.org/backend/pkg/app"
	"example.org/log"
)

func main() {
	logger := log.NewLogger("backend")
	a := app.NewApp(logger)
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()
	err := a.Start(ctx)
	if err != nil {
		logger.Fatal("Starting app: %w", err)
	}
	<-ctx.Done()
}

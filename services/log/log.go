package log

import "github.com/rs/zerolog/log"

type Logger struct {
	component string
}

func NewLogger(component string) *Logger {
	return &Logger{component}
}

func (l *Logger) Fatal(msg string, args ...interface{}) {
	log.Fatal().Str("component", l.component).Msgf(msg, args...)
}

func (l *Logger) Error(msg string, args ...interface{}) {
	log.Error().Str("component", l.component).Msgf(msg, args...)
}

func (l *Logger) Warn(msg string, args ...interface{}) {
	log.Warn().Str("component", l.component).Msgf(msg, args...)
}

func (l *Logger) Info(msg string, args ...interface{}) {
	log.Info().Str("component", l.component).Msgf(msg, args...)
}

func (l *Logger) Debug(msg string, args ...interface{}) {
	log.Debug().Str("component", l.component).Msgf(msg, args...)
}

func (l *Logger) Trace(msg string, args ...interface{}) {
	log.Trace().Str("component", l.component).Msgf(msg, args...)
}

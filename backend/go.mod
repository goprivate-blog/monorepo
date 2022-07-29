module example.org/backend

go 1.18

replace (
	example.org/log => github.com/goprivate-blog/log v0.0.0-20220729134106-9929b453df48
	example.org/server => github.com/goprivate-blog/server v0.0.0-20220729134122-614ea9f1f97f
)

require (
	example.org/log v0.0.0-00010101000000-000000000000
	example.org/server v0.0.0-00010101000000-000000000000
)

require (
	github.com/mattn/go-colorable v0.1.12 // indirect
	github.com/mattn/go-isatty v0.0.14 // indirect
	github.com/rs/zerolog v1.27.0 // indirect
	golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6 // indirect
)

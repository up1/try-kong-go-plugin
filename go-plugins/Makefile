.PHONY: all

all: go-hello.so go-log.so cp

cp:
	cp go-hello.so ./kong

go-hello.so: go-hello.go
	go build -buildmode=plugin go-hello.go

go-log.so: go-log.go
	go build -buildmode=plugin go-log.go

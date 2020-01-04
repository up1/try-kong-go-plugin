/*
A "hello world" plugin in Go,
which reads a request header and sets a response header.
*/
package main

import (
	"github.com/Kong/go-pdk"
)

type Config struct {
	Path   string
	Reopen bool
}

func New() interface{} {
	return &Config{}
}

func (c Config) Access(kong *pdk.PDK) {
	kong.Response.SetHeader("X-Kong-Go", "Hello from golang")
}

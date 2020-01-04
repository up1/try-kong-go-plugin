FROM golang:1.13.5-stretch as A1
WORKDIR  /src
COPY go.mod /src/go.mod
COPY go-hello.go /src/go-hello.go
# COPY go-log.go /src/go-log.go
RUN GOOS=linux go build -ldflags="-s -w" -buildmode=plugin go-hello.go


# FROM kong-docker-kong-preview-docker.bintray.io/kong:2.0.0preview1-centos
FROM kong:2.0.0rc1-ubuntu
# FROM kong-preview1
COPY kong.yml /kong.conf.d/kong.yml
COPY --from=A1  /src/go-hello.so /kong.conf.d/go-hello.so
RUN chmod 777 -R /kong.conf.d/
RUN chmod 777 -R /usr/local/kong/
COPY go-pluginserver /usr/local/kong/go-pluginserver
COPY start_server.sh /start_server.sh
RUN cp /etc/kong/kong.conf.default /etc/kong/kong.conf
CMD sh /start_server.sh
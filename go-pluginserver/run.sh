docker container run --rm -e GOOS=linux -v $(pwd):/src -w /src golang:1.13.5-stretch go build -ldflags="-s -w" -o go-pluginserver -v
cp go-pluginserver ../go-plugins
FROM alpine:3.2

RUN apk update && apk add curl git mercurial bzr go bash && rm -rf /var/cache/apk/*

ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN go get github.com/tools/godep

VOLUME /build

COPY build.sh /
ENTRYPOINT ./build.sh


# Golang Build Helper

Resolves dependencies using godep and builds a target project, emitting an executable into the working directory.

Uses godep. Prep your environment as follows:

```
    go get github.com/tools/godep
    godep save
```

Build target is alpine:3.2. 

By default, emits a file named `build-YYYYMMDD-HHMM`.   This behavior can be overridden by passing the `FILENAME` environmental var into the container

# Examples

```
    // builds the project in the present working directory
    $ docker run -v $PWD:/build golang-build:0.1

    // builds the project in the present working directory and emits an executable with a specific filename
    $ docker run -v $PWD:/build -e FILENAME=my-project golang-build:0.1
```


# Example makefile

Also included is an example makefile.  You could include this with your project, for example, to build it using this container simply by calling `make build`

#!/bin/bash

export

now=$(date +"%Y%m%d-%H%M")
filename=$FILENAME

if [ "$filename" = "" ]; then
    filename="build-$now"
fi;

echo building project as $filename

mkdir -p $GOPATH/src/_
ln -s /build $GOPATH/src/_/build

cd build
godep get -v
godep go build -o $filename -a -v

ec=$?
if [[ $ec = 0 ]]; then
    echo emitted $filename
else
    echo build failed
fi;

exit $ec

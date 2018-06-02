#!/bin/bash

go get -d github.com/tensorflow/tensorflow/tensorflow/go

cd ${GOPATH}/src/github.com/tensorflow/tensorflow
./configure
bazel build --config opt //tensorflow:libtensorflow.so

export LIBRARY_PATH=${GOPATH}/src/github.com/tensorflow/tensorflow/bazel-bin/tensorflow
# OS X
export DYLD_LIBRARY_PATH=${GOPATH}/src/github.com/tensorflow/tensorflow/bazel-bin/tensorflow

go test github.com/tensorflow/tensorflow/tensorflow/go
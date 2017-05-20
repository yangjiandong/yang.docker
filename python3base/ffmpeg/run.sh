#! /bin/bash

# docker run --rm -ti yangjiandong/py3ffmpeg:v2 ffmpeg -version

docker run --rm -ti -v ${PWD}:/work yangjiandong/py3ffmpeg:v2


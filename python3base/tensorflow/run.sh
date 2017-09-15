#! /bin/bash

# docker run --rm -ti -v ${PWD}:/work one/py3tensorflow:v2

docker run -p 8888:8888 \
    -v ${PWD}/work:/notebooks \
    -it one/py3tensorflow:v3
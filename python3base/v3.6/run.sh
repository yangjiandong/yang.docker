#! /bin/bash

# docker run --rm -ti -v ${PWD}:/work one/py3tensorflow:v2

docker run -p 8888:8888 \
    -v ${PWD}/work:/work \
    --rm -it one/py3base:3.6 /bin/bash
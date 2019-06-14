#! /bin/bash

docker run -p 8888:8888 \
    -v ${PWD}/work:/work \
    -e TZ=Asia/Shanghai \
    -e PASSWORD=123 \
    --rm -it one/keras:x /bin/bash

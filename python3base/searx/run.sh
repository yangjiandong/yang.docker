#! /bin/bash

# docker run -d --name searx -p 127.0.0.1:8888:8888 -e IMAGE_PROXY=True searx

docker run -d -p 8888:8888 \
    --name searx \
    -e TZ=Asia/Shanghai \
    one/searx:0.15.0

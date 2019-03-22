#! /bin/bash

docker run \
    -d \
    --name node-server \
    -e TZ=Asia/Shanghai \
    -p 8088:80 \
    one/node-server

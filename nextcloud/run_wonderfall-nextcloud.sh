#! /bin/bash

# docker pull wonderfall/nextcloud

docker run --rm -i -t \
    -p 8080:8888 \
    -v $(pwd)/data2:/data \
    -v $(pwd)/apps2:/apps2 \
    wonderfall/nextcloud
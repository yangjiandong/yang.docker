#! /bin/bash

docker run -it --rm --name openresty-test -v ~/workspace/openresty/openresty-test:/app -p 6699:6699 yangjiandong/openresty:1.11.2 /bin/bash
#docker run -it -v ~/workspace/openresty/openresty-test:/app -p 6699:6699 -p 8080:8080 yangjiandong/openresty_ffmpeg /bin/bash

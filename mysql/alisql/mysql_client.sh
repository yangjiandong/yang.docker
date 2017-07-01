#! /bin/bash

docker run -it --rm \
    --volumes-from=alisql \
    registry.cn-hangzhou.aliyuncs.com/acs-sample/alisql:latest \
    mysql -uroot -p

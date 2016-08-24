#!/usr/bin/env bash

# remote user,pwd
#DB_REMOTE_ROOT_HOST
#  -e 'DB_REMOTE_ROOT_NAME=root' -e 'DB_REMOTE_ROOT_PASS=123' \
docker run --name mysql \
    -e 'DB_NAME=demo' \
    -v ~/mysql_data/data:/var/lib/mysql \
    -p 3306:3306 -d \
    yangjiandong/mysql:5.5


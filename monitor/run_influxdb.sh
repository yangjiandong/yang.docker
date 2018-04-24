#! /bin/bash

docker run -d \
    --name influxdb \
    -v $(pwd)/data:/data \
    -p 8083:8083 \
    -p 8086:8086 \
    -e ADMIN_USER="root" -e INFLUXDB_INIT_PWD="123" \
    -e PRE_CREATE_DB="app" \
    tutum/influxdb

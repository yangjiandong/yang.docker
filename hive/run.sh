#! /bin/bash

docker run -it \
    --name hive \
    -h hive \
    -p 9083:9083 \
    -p 8088:8088 \
    -p 8042:8042 \
    -p 50070:50070 \
    -p 8085:8080 \
    -p 4040:4040 \
    -p 7077:7077 \
    -p 2022:22  \
    --rm \
    -v ~/workspace/docker/yang.docker/hive:/work \
    -v ~/workspace/docker/yang.docker/hive/hive:/hive \
    -v ~/workspace/docker/yang.docker/hive/hive_conf:/usr/local/hive/conf \
    -v ~/data:/data \
    -v ~/data/log:/usr/local/hadoop/logs \
    yangjiandong/hive:1.2.1 /bin/bash

#!/usr/bin/env bash

# -v "$PWD/config":/usr/share/elasticsearch/config
docker run --rm -p 9300:9300 -p 9200:9200 \
        -u 1000 \
        -v "$PWD/esdata":/usr/share/elasticsearch/data \
        yangjiandong/elsearch:2.4 

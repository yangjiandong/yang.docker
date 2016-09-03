#!/usr/bin/env bash

# -v "$PWD/config":/usr/share/elasticsearch/config
docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data yangjiandong/elsearch:2.4

#! /bin/bash

docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 \
    -e TZ="Asia/Shanghai" \
    -v $(pwd)/elk-data:/var/lib/elasticsearc \
    -it --name elk one/elk:5.5

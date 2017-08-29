#! /bin/bash

    # -e ELASTICSEARCH_START=0 \
    # -e LOGSTASH_START=0 \
    # -e KIBANA_START=0 \

docker run \
    -p 5601:5601 \
    -p 9200:9200 \
    -p 9300:9300 \
    -p 4560:4560 \
    -p 5044:5044 \
    -e TZ="Asia/Shanghai" \
    -v $(pwd)/elk-data:/var/lib/elasticsearc \
    -v $(pwd)/conf/12-input.conf:/etc/logstash/conf.d/12-input.conf \
    -it \
    --rm \
    --name elk one/elk:5.5

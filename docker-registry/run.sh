#! /bin/bash

# docker run --rm -i -t yangjiandong/docker-registry /bin/bash

docker run \
    --rm -i -t \
    -v ~/workspace/docker/yang.docker/registry/conf:/registry-conf \
    -v ~/workspace/docker/yang.docker/registry/data:/registry-data \
    -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml \
    -e SETTINGS_FLAVOR=dev \
    -p 5000:5000 \
    yangjiandong/docker-registry

#!/bin/bash

docker run --name my-json-server -p 8080:8080 -v ~/workspace/docker/yang.docker/docker-json-server/db.json:/data/db.json yangjiandong/json-server 

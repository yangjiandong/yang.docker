#! /bin/bash

#docker pull rabbitmq:3.6.0-management
docker run -d \
    -p 5672:5672 \
    -p 15672:15672 \
    -e RABBITMQ_DEFAULT_USER=admin \
    -e RABBITMQ_DEFAULT_PASS=123 \
    --memory 2048m \
    --name rabbitmq \
    rabbitmq:3.7.7-management

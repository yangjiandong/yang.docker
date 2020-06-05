#! /bin/bash

docker run -it --rm \
    -v $(pwd)/temp:/temp \
    one/postgresql:8.4 \
    psql -h 192.168.1.182 -U postgres

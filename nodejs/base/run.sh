#!/usr/bin/env bash

docker run -i -t --rm \
    -p 8080:8080 \
    -v $(pwd)/webapp:/workspace \
    one/nodejs:7.0 \
    /bin/bash

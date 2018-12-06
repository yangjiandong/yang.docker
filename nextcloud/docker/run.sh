#! /bin/bash

docker run --rm -i -t \
    -p 8080:80 \
    -v $(pwd)/data:/var/www/html/data \
    one/nextcloud 
    # /bin/bash
# docker run -d -p 8080:80 one/nextcloud
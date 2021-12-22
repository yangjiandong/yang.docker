#!/usr/bin/env bash

docker run \
    -d \
    --name apache_svn \
    -p 81:80  \
    -v $(pwd)/ssh-work/logs:/etc/httpd/logs \
    -v $(pwd)/ssh-work/conf.d:/etc/httpd/conf.d \
    -v $(pwd)/ssh-work/www:/var/www \
    -v $(pwd)/ssh-work/svn:/var/svn \
    --sysctl net.ipv4.ip_local_port_range="1024 65535" \
    --ulimit nofile=65536:65536 \
    --privileged=true \
    one/apache:2.0

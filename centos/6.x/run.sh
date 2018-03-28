#! /bin/bash

docker run --rm \
    -it \
    --sysctl net.ipv4.ip_local_port_range="8001 65000" \
    one/centos:6.9 \
    /bin/bash

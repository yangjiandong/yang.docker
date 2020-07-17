#! /bin/bash
# --privileged=true

docker run --rm \
    -it \
    --sysctl net.ipv4.ip_local_port_range="8001 65000" \
    -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
    -v $(pwd)/ssh:/root/.ssh \
    -v $(pwd)/tpcc:/workspace \
    --name jtpcc \
    one/java:8 \
    /bin/bash

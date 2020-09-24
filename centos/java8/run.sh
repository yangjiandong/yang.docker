#! /bin/bash
# --privileged=true

docker run --rm \
    -it \
    --sysctl net.ipv4.ip_local_port_range="8001 65000" \
    -e JAVA_OPTS='-Xms1g -Xmx2g' \
    -v $(pwd)/zuul:/workspace \
    -p 8080:8080 \
    --name center \
    one/java:8 \
    java -Djava.security.egd=file:/dev/./urandom -jar sshapp.jar --spring.profiles.active=pro

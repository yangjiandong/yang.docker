#! /bin/bash

docker run --rm \
    -it \
    -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
    -v $(pwd)/workspace:/workspace \
    -p 8080:8080 \
    --name center \
    one/java:8 \
    java -Djava.security.egd=file:/dev/./urandom -jar sshapp.jar --spring.profiles.active=pro

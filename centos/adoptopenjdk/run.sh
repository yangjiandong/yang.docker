#! /bin/bash
# --privileged=true

docker run --rm \
  -it \
  -e TZ=Asia/Shanghai \
  -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
  -e LANG=zh_CN.UTF-8 \
  -e LANGUAGE=zh_CN:cn \
  adoptopenjdk/openjdk8-openj9:centos

# adoptopenjdk:8-openj9

# docker run --rm \
#     -it \
#     --sysctl net.ipv4.ip_local_port_range="8001 65000" \
#     -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
#     -v $(pwd)/zuul:/workspace \
#     -p 8080:8080 \
#     --name center \
#     one/java:8 \
#     java -Djava.security.egd=file:/dev/./urandom -jar sshapp.jar --spring.profiles.active=pro

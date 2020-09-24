#
docker run -it --rm \
  -m2g \
  --cpus=2 \
  -e JAVA_OPTS='-Xms512m -Xmx2g' \
  -v $(pwd)/works:/workspace \
  --name jdk8u261 \
  one/java:8u261 \
  /bin/bash

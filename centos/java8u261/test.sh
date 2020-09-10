docker run -it --rm \
  -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
  -m4g \
  one/java:8u261 \
  /bin/bash

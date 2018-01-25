#!/usr/bin/env bash

#docker run --name tomcat -p 8080:8080 \

# docker run --rm -p 8080:8080 \
#     -v $(pwd)/webapps:/tomcat/webapps \
#     -v $(pwd)/logs:/tomcat/logs \
#     -v $(pwd)/logs:/tomcat/bin/logs \
#     -v $(pwd)/ssh-work:/ssh-work \
#     --name tomcat8 \
#     one/java8:1.0

docker run -d -p 8080:8080 \
    -v $(pwd)/webapps:/tomcat/webapps \
    -v $(pwd)/logs:/tomcat/logs \
    -v $(pwd)/logs:/tomcat/bin/logs \
    -v $(pwd)/ssh-work:/ssh-work \
    --name tomcat8 \
    one/java8:1.0
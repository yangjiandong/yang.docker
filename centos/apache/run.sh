#!/usr/bin/env bash

#docker run --name tomcat -p 8080:8080 \

# docker run --rm -p 8080:8080 \
#     -v $(pwd)/webapps:/tomcat/webapps \
#     -v $(pwd)/logs:/tomcat/logs \
#     -v $(pwd)/logs:/tomcat/bin/logs \
#     -v $(pwd)/ssh-work:/ssh-work \
#     --name tomcat8 \
#     one/java8:1.0

docker run --rm -it \
    -p 81:80  \
    -v $(pwd)/ssh-work/conf:/etc/httpd/conf \
    -v $(pwd)/ssh-work/conf.d:/etc/httpd/conf.d \
    -v $(pwd)/ssh-work/www:/var/www \
    -v $(pwd)/ssh-work/svn:/var/svn \
    one/apache:1.0 /bin/bash
#!/usr/bin/env bash

docker run --name tomcat -p 8080:8080 \
	-v ~/workspace/docker/yang.docker/java8tomcat8/webapps:/tomcat/webapps \
	-v ~/workspace/docker/yang.docker/java8tomcat8/logs:/tomcat/logs \
	-v ~/workspace/docker/yang.docker/java8tomcat8/logs:/tomcat/bin/logs \
	yangjiandong/java8tomcat8 

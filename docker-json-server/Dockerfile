FROM node:latest
MAINTAINER yangjiandong <59338947@qq.com>

# Exclude npm cache from the image
VOLUME /root/.npm

# Use private npm
ADD npmrc /root/.npmrc

RUN npm install -g json-server

WORKDIR /data
VOLUME /data

# EXPOSE 80
# ADD run.sh /run.sh
# ENTRYPOINT ["bash", "/run.sh"]
# CMD []

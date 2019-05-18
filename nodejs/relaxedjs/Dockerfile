FROM node:8.16.0-alpine

ENV CHROME_BIN="/usr/bin/chromium-browser"\
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

#更新Alpine的软件源为国内（清华大学）的站点，因为从默认官源拉取实在太慢了。。。
RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories \
      && echo "https://mirrors.aliyun.com/alpine/v3.9/community/" >> /etc/apk/repositories \
        && apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        udev \
        ttf-freefont \
        bash \
        chromium \
        && rm -rf /var/cache/apk/* \
        && /bin/bash

# RUN apk add --update bash && rm -rf /var/cache/apk/*

# Use private npm
ADD npmrc /root/.npmrc

# Create app directory
RUN mkdir /workspace
WORKDIR /workspace

# Bundle app source
# COPY . /workspace
# RUN npm install
# CMD [ "npm", "start" ]

EXPOSE 8888

RUN npm i -g relaxedjs --unsafe-perm

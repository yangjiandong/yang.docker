FROM yangjiandong/base:v3

# Use private npm
# ADD npmrc /root/.npmrc
RUN apt-get update && \
    apt-get install -y nodejs npm \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN ln -s `which nodejs` /usr/bin/node

# Use private npm
ADD npmrc /root/.npmrc

# RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
#RUN npm cache clean -f \
    #&& npm install -g n \
    #&& PROJECT_NAME="node" PROJECT_URL="https://npm.taobao.org/mirrors/node/" n project stable

# npm install -g nodeppt

EXPOSE 8080

WORKDIR /workspace
#VOLUME /data


FROM yangjiandong/base:v3

# Use private npm
# ADD npmrc /root/.npmrc
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update 

#RUN apt-get install -y nodejs \
    #&& apt-get clean \
    #&& apt-get autoclean \
    #&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# RUN ln -s `which nodejs` /usr/bin/node

ADD nodejs_6.9.2-1nodesource1-xenial1_amd64.deb /root/nodejs_6.9.2-1nodesource1-xenial1_amd64.deb

RUN dpkg -i /root/nodejs_6.9.2-1nodesource1-xenial1_amd64.deb

# Use private npm
ADD npmrc /root/.npmrc

# RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
#RUN npm cache clean -f \
    #&& npm install -g n \
    #&& PROJECT_NAME="node" PROJECT_URL="https://npm.taobao.org/mirrors/node/" n project stable

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org 
#    cnpm i node-sass
RUN npm install node-sass -g

# npm install -g nodeppt

EXPOSE 8080
EXPOSE 3000

WORKDIR /workspace
#VOLUME /data


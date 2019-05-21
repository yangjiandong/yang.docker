FROM one/centos:7.6

# 配置环境变量
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION 8.15.0

RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install v$NODE_VERSION \
    && nvm use v$NODE_VERSION \
    && nvm alias default v$NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

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

FROM one/centos:7

# 配置环境变量
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION 12.18.2

RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install v$NODE_VERSION \
    && nvm use v$NODE_VERSION \
    && nvm alias default v$NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# Use private npm
# ADD npmrc /root/.npmrc

RUN yum -y install libX11 libXcomposite libXcursor libXdamage libXext libXi libXtst cups-libs libXScrnSaver libXrandr alsa-lib pango atk at-spi2-atk gtk3 \
  && yum clean all && rm -fr /tmp/*

# 中文字体
COPY ./fonts/Songti.ttc /usr/share/fonts
RUN fc-cache -f -v

# Create app directory
RUN mkdir /workspace
WORKDIR /workspace

EXPOSE 8888

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

# for chrome, git
RUN yum -y install \
  libX11 libXcomposite libXcursor libXdamage \
  libXext libXi libXtst cups-libs libXScrnSaver \
  libXrandr alsa-lib pango atk at-spi2-atk gtk3 \
  curl-devel expat-devel gettext-devel openssl-devel \
  zlib-devel gcc-c++ perl-ExtUtils-MakeMaker \
  make unzip zip \
  && yum clean all && rm -fr /tmp/*

# 中文字体
COPY ./fonts/Songti.ttc /usr/share/fonts
RUN fc-cache -f -v

# RUN yum -y remove git
# git
# ENV GIT_DIR=/usr/local/git

# COPY git-2.9.5.tar.gz .
# RUN tar -zxvf git-2.9.5.tar.gz && \
#     mkdir $GIT_DIR && \
#     cd git-2.9.5 && \
#     ./configure --prefix=$GIT_DIR && \
#     make && \
#     make install \
#     && rm -rf /git-2.9.5.tar.gz \
#     && rm -rf /git-2.9.5

# ENV PATH=$GIT_DIR/bin:$PATH

# chrome
ENV CHROME_DIR=/usr/local/chrome
RUN cd /
COPY chrome-linux.zip .
RUN unzip chrome-linux.zip \
  && mv chrome-linux $CHROME_DIR \
  && rm -rf \chrome-linux.zip

COPY gitconfig /root/.gitconfig

# Create app directory
RUN mkdir /workspace
WORKDIR /workspace

EXPOSE 8888

#
# thomasweise/docker-pandoc
#
# This is an image with a pandoc installation with several filters
# which can make use of a full texlive installation with tools and
# fonts.
# Source: https://github.com/thomasWeise/docker-pandoc/
# License: GNU GENERAL PUBLIC LICENSE, Version 3, 29 June 2007
# The license applies to the way the image is built, while the
# software components inside the image are under the respective
# licenses chosen by their respective copyright holders.
#
FROM thomasweise/docker-texlive-full
MAINTAINER Thomas Weise <tweise@hfuu.edu.cn>

# 使用 aliyuncs 的源
COPY sources.list /etc/apt/sources.list

RUN apt-get clean &&\
    apt-get update &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\
    apt-get update &&\
# install tzdata, which we will need down the line
    apt-get install -f -y tzdata sudo

ENV TZ 'Asia/Shanghai'
RUN echo $TZ > /etc/timezone && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

RUN \
# We install cabal, a Haskell package manager, because we want the newest
# pandoc and filters which we can only get from there.
# We also install zlib1g, as we will need it later on.
# We install librsvg2 in order to make svg -> pdf conversation possible.
# imagemagick may be needed by the latex-formulae-pandoc filter
    apt-get install -f -y cabal-install \
                          imagemagick \
                          librsvg2-bin \
                          librsvg2-common \
                          zlib1g \
                          zlib1g-dev \
                          libglib2.0-dev git make cmake g++ &&\
# fix the access rights for imagemagick
  sed -i -e 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml &&\
  sed -i -e 's/<\/policymap>/<policy domain="module" rights="read|write" pattern="{PS,PDF,XPS}" \/>\n<\/policymap>/g' /etc/ImageMagick-6/policy.xml &&\
# clean up all temporary files
    apt-get clean &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -f /etc/ssh/ssh_host_*

COPY config /root/.cabal/
RUN \
# get the newest list of packages
    cabal update &&\
# install the dependencies of the packages we want
    cabal install --dependencies-only \
                  pandoc \
                  pandoc-citeproc \
                  pandoc-crossref &&\
# install the packages we want
    cabal install pandoc \
                  pandoc-citeproc \
                  pandoc-crossref &&\
# clear unnecessary cabal files
    rm -rf /root/.cabal/logs &&\
    rm -rf /root/.cabal/packages &&\
# clean up all temporary files
    rm -rf /tmp/* /var/tmp/*

# we remember the path to pandoc in a special variable
ENV PANDOC_DIR=/root/.cabal/bin/

# add pandoc to the path
ENV PATH=${PATH}:${PANDOC_DIR}

#multimarkdown
ENV cc=gcc

RUN git clone https://github.com/fletcher/MultiMarkdown-6.git \
    && cd MultiMarkdown-6 \
#    && ./update_git_modules \
#    && ./link_git_modules \
    && make && cd build && make \
    && cp multimarkdown /bin \
    && cd / && rm -rf MultiMarkdown-6

# node, gitbook
# 配置环境变量
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION 8.15.0
# Use private npm
ADD npmrc /root/.npmrc

RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN . $NVM_DIR/nvm.sh \
    && nvm install v$NODE_VERSION \
    && nvm use v$NODE_VERSION \
    && nvm alias default v$NODE_VERSION \
    && npm install gitbook-cli -g \
    && gitbook -V

# ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

EXPOSE 4000

# COPY sources.list /etc/apt/sources.list
# RUN apt-get install calibre
COPY calibre-4.3.0-x86_64.txz .
RUN mkdir -p /opt/calibre \
  && rm -rf /opt/calibre/* \
  && tar xvf /calibre-4.3.0-x86_64.txz -C /opt/calibre \
  && /opt/calibre/calibre_postinstall \
  && rm -rf /calibre-4.3.0-x86_64.txz

ENV CALIBRE_PATH /opt/calibre
ENV PATH $CALIBRE_PATH:$PATH
ENV QTWEBENGINE_DISABLE_SANDBOX 1

# plantuml
RUN \
    apt-get update &&\
    apt-get install -f -y graphviz default-jre

# Songti.ttc
COPY Songti.ttc /usr/share/fonts/Songti.ttc

FROM yangjiandong/base:v2 

# Use private npm
ADD npmrc /root/.npmrc

# Install dependencies
RUN apt-get update && \ 
    apt-get install -y curl git calibre && \
    apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# 使用 office 的源
COPY sources.office.txt /etc/apt/sources.list

RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup | bash - && \
	apt-get install -y nodejs && \
	npm install -g gitbook-cli

# Install latest version
RUN gitbook fetch 2.6.4

RUN mkdir /gitbook
WORKDIR /gitbook

EXPOSE 4000

CMD ["gitbook", "serve", "/gitbook"]

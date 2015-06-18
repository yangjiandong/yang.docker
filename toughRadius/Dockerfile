FROM yangjiandong/base
MAINTAINER yangjiandong <59338947@qq.com>

RUN locale-gen zh_CN.UTF-8

ENV LANG  zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

RUN apt-get install -y \
    python-pip \
    python2.7-dev


# Add and install Python modules
ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

# add code
ADD . /code
WORKDIR /code

#EOP

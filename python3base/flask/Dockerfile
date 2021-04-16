FROM python:3.9-slim-buster

RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

# COPY requirements.txt .
RUN python3.9 -m pip install --no-cache-dir --upgrade \
    -i https://mirrors.aliyun.com/pypi/simple \
    pip \
    setuptools \
    wheel
RUN python3.9 -m pip install --no-cache-dir \
    -i https://mirrors.aliyun.com/pypi/simple \
    flask \
    graphene \
    py2neo \
    flask-graphql \
    maya \
    environs \
    flasgger \
    flask-marshmallow \
    apispec

EXPOSE 5000

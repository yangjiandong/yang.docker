FROM python:3.6-buster

COPY pip.conf /root/.pip/pip.conf

RUN sed -i 's#http://deb.debian.org#https://mirrors.aliyun.com#g' /etc/apt/sources.list


RUN python3.6 -m pip install --no-cache-dir --upgrade \
    -i https://mirrors.aliyun.com/pypi/simple \
    pip \
    setuptools \
    wheel

COPY requirements.txt .
RUN python3.6 -m pip install --no-cache-dir \
    -r requirements.txt

RUN python3.6 -m pip install baostock -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn

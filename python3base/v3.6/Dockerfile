FROM python:3.6.6

# COPY pip.conf ~/.pip/pip.conf
# PYPI repository location
ARG pypi_url=https://mirrors.aliyun.com/
# PYPI index location
ARG pypi_index_url=https://mirrors.aliyun.com/pypi/simple

RUN mkdir ~/.pip && \
    echo "[global]" > ~/.pip/pip.conf && \
    echo "index = $pypi_url" >> ~/.pip/pip.conf && \
    echo "index-url = $pypi_index_url" >> ~/.pip/pip.conf && \
    echo "trusted-host = $(echo $pypi_url | perl -pe 's|^.*?://(.*?)(:.*?)?/.*$|$1|')" >> ~/.pip/pip.conf

RUN pip3 install \
        ipykernel \
        scipy \
        jupyter \
        matplotlib \
        pandas \
        pdfminer.six \
        pyplotz requests \
        && \
    python3 -m ipykernel.kernelspec

# RUN pip3 --no-cache-dir install \
#     pandas \
#     jupyter
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
# https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# jupyter
EXPOSE 8888

RUN pip3 install \
    wordcloud jieba plotnine

COPY sources.txt /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    locales \
    libblas3 \
    liblapack3 libnss3 \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install -U turicreate

# 混淆代码保护
RUN pip3 install pyarmor

# Setup a working directory to allow for
# docker run --rm -ti -v ${PWD}:/work ...
# =======================================
RUN mkdir /work
WORKDIR /work
#EOP

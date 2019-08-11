FROM ubuntu:bionic

ADD sources.list.ustc /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-pip \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s `which pip3` /usr/bin/pip && \
  pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
  numpy \
  pandas \
  zepid \
  matplotlib \
  statsmodels \
  lifelines \
  sklearn

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
  ipykernel \
  jupyter \
  jupyterlab && \
  python3 -m ipykernel.kernelspec

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /

# jupyter
EXPOSE 8888

RUN mkdir /work
WORKDIR /work
#EOP

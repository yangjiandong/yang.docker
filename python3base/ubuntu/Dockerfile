FROM ubuntu:bionic

ADD sources.list.ustc /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-pip tzdata \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TZ 'Asia/Shanghai'
RUN echo $TZ > /etc/timezone && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

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

# # 类似 maltab，开源统计软件, Octave
# RUN apt-get install -y --no-install-recommends octave \
#         octave-symbolic octave-miscellaneous \
#         python-sympy \
#         gnuplot ghostscript && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple octave_kernel

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /

# jupyter
EXPOSE 8888

RUN mkdir /work
WORKDIR /work
#EOP

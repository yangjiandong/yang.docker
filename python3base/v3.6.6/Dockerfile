FROM ubuntu:bionic

ADD sources.list.ustc /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-pip tzdata \
    curl wget \
    octave \
    octave-symbolic octave-miscellaneous \
    python-sympy \
    gnuplot ghostscript \
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
  sklearn \
  octave_kernel

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

# matplotlib 中文字体
# COPY font/Songti.ttc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/fonts/ttf
# COPY font/matplotlibrc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/

RUN mkdir /work
WORKDIR /work

# other matplotlib 扩展
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
  seaborn \
  missingno

# font
COPY font/matplotlibrc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/matplotlibrc
COPY font/Songti.ttc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/fonts/ttf

#EOP

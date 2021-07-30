FROM python:3.9-buster

COPY pip.conf /root/.pip/pip.conf

RUN sed -i 's#http://deb.debian.org#https://mirrors.aliyun.com#g' /etc/apt/sources.list


# RUN apt-get update && apt-get install -y \
#   build-essential \
#   cmake \
#   libboost-system-dev \
#   libboost-thread-dev \
#   libboost-program-options-dev \
#   libboost-test-dev \
#   libeigen3-dev \
#   zlib1g-dev \
#   libbz2-dev \
#   liblzma-dev \
#   && rm -rf /var/lib/apt/lists/*


COPY requirements.txt .
RUN python3.9 -m pip install --no-cache-dir \
    -r requirements.txt
RUN python3.9 -m pip install --no-cache-dir \
  ipykernel \
  jupyter \
  jupyterlab && \
  python3.9 -m ipykernel.kernelspec

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /

# jupyter
EXPOSE 8888

RUN mkdir /work
WORKDIR /work

# font
COPY font/matplotlibrc /usr/local/lib/python3.9/dist-packages/matplotlib/mpl-data/matplotlibrc
COPY font/Songti.ttc /usr/local/lib/python3.9/dist-packages/matplotlib/mpl-data/fonts/ttf

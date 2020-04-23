FROM hub.baidubce.com/paddlepaddle/paddle:1.7.2

ENV TZ 'Asia/Shanghai'
RUN echo $TZ > /etc/timezone && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

RUN pip3.6 install -i https://pypi.doubanio.com//simple \
  ipykernel \
  jupyter \
  jupyterlab \
  prompt-toolkit==2.0.10 && \
  python3.6 -m ipykernel.kernelspec

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY ./install/jupyter_notebook_config.py ${CONFIG_PATH}

COPY ./install/run_jupyter.sh /

# jupyter
EXPOSE 8888

RUN mkdir /work
WORKDIR /work

# font
COPY ./install/font/matplotlibrc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/matplotlibrc
COPY ./install/font/Songti.ttc /usr/local/lib/python3.5/dist-packages/matplotlib/mpl-data/fonts/ttf

#EOP

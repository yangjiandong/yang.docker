FROM one/py3base:3.6

RUN pip3 install \
  keras tensorflow pillow h5py \
  matplotlib pandas numpy scikit-learn scipy \
  ninja yacs cython jupyterlab \
  captcha

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /
# node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# extension
RUN jupyter labextension install @jupyterlab/toc

RUN apt-get -y install graphviz
# Clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

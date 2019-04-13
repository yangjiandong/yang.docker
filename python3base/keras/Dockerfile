FROM one/py3base:3.6

RUN pip3 install keras tensorflow pillow h5py

RUN pip3 install matplotlib pandas numpy scikit-learn scipy

## add jupyterlab
RUN pip install ninja yacs cython jupyterlab

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /
# node
# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# RUN apt-get install -y nodejs

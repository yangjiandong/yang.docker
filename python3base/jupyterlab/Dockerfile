FROM one/py3base:3.6

RUN pip install ninja yacs cython jupyterlab

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"
COPY "jupyter_notebook_config.py" ${CONFIG_PATH}

COPY run_jupyter.sh /

# node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -y nodejs

# ENTRYPOINT ["sh", "-c", "jupyter notebook --allow-root -y --no-browser --ip=0.0.0.0 --config=${CONFIG_PATH}"]

FROM yangjiandong/py3base:v3

RUN pip3 --no-cache-dir install \
        ipykernel \
        scipy \
        jupyter \
        matplotlib \
        pandas \
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

ENV TENSORFLOW_VERSION 1.3.0

RUN pip3 --no-cache-dir install \
        https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-${TENSORFLOW_VERSION}-cp35-cp35m-linux_x86_64.whl

# tensorboard
EXPOSE 6006

# jupyter
EXPOSE 8888

WORKDIR "/notebooks"

CMD ["sh","/run_jupyter.sh"]

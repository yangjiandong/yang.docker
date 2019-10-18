FROM one/py3base:3.6.6

RUN pip install torch==1.3.0 -f https://pypi.tuna.tsinghua.edu.cn/simple/torch/
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
  torchvision \
  h5py

# spotlight
COPY ./work/spotlight-0.1.6 /tmp/spotlight-0.1.6
RUN pip install /tmp/spotlight-0.1.6 && \
    rm -rf /tmp/spotlight-0.1.6

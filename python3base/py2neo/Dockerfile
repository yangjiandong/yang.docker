FROM one/py3base:3.6.6

ARG pypi_url=https://mirrors.aliyun.com/
ARG pypi_index_url=https://mirrors.aliyun.com/pypi/simple

RUN mkdir ~/.pip && \
  echo "[global]" > ~/.pip/pip.conf && \
  echo "index = $pypi_url" >> ~/.pip/pip.conf && \
  echo "index-url = $pypi_index_url" >> ~/.pip/pip.conf && \
  echo "trusted-host = $(echo $pypi_url | perl -pe 's|^.*?://(.*?)(:.*?)?/.*$|$1|')" >> ~/.pip/pip.conf

RUN pip3 install \
  jieba \
  pyahocorasick \
  py2neo \
  gensim \
  python-Levenshtein \
  neo4j


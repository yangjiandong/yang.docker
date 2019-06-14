FROM one/py3base:3.6

ARG VERSION=0.15.0

ENV BASE_URL=False IMAGE_PROXY=False \
    UID=991 GID=991

RUN mkdir /usr/local/searx && cd /usr/local/searx \
  && wget -qO- https://github.com/asciimoo/searx/archive/v${VERSION}.tar.gz | tar xz --strip 1 \
  && pip3 install --upgrade setuptools \
  && pip3 install --no-cache -r requirements.txt \
  && sed -i "s/127.0.0.1/0.0.0.0/g" searx/settings.yml

COPY start.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8888

CMD ["run.sh"]

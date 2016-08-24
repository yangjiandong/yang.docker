FROM yangjiandong/py27base:v2

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /code
WORKDIR /code

#COPY . /code
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh
EXPOSE 8000

CMD /docker-entrypoint.sh

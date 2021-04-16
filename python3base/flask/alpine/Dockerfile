FROM python:3.9.4-alpine3.13

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    && pip install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple \
    flask \
    graphene \
    py2neo \
    flask-graphql \
    maya \
    environs \
    flasgger \
    flask-marshmallow \
    apispec \
    && apk del .build-deps
# RUN apk del .build-deps

# COPY . /app/
WORKDIR /app/
EXPOSE 5000

# # we have to wait even after wait-for.sh
# # because neo4j doesn't work when it starts listening to a port
# CMD echo "Waiting for $NEO4J_HOST:$NEO4J_PORT..." && \
#     /app/wait-for.sh -t 60 $NEO4J_HOST:$NEO4J_PORT && \
#     sleep 15 && \
#     python run.py

CMD echo "Waiting for..." && \
    sleep 2 && \
    python run.py

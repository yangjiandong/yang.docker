FROM python:3.9.4-alpine3.13

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev cargo
# build-base gcc libffi-dev libressl-dev

COPY Pipfile* /tmp/
WORKDIR /tmp/
RUN pip install -i https://mirrors.aliyun.com/pypi/simple pipenv
RUN pipenv install

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

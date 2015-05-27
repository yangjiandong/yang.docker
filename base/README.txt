README
======

base
---

    see: https://github.com/Krijger/docker-cookbooks/tree/master/supervisor

  注意： 包含 Python 2.7.6 / Python 3.4.0。

create my self docker repos
---

[](https://github.com/docker/docker-registry)
[](http://www.vpsee.com/2013/11/build-your-own-docker-private-regsitry-service/)

git clone https://github.com/dotcloud/docker-registry
cd docker-registry

cp config_sample.yml config.yml
vi config.yml

    dev:
        storage: local
        storage_path: /home/vpsee/registry
        loglevel: debug

mkdir /home/vpsee/registry

sudo apt-get install build-essential python-dev libevent-dev python-pip libssl-dev
sudo pip install -r requirements.txt

sudo gunicorn --access-logfile - --debug -k gevent -b 0.0.0.0:80 -w 1 wsgi:application


  - END -

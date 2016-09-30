ELK
===

2016.09.29
---

参考 https://elk-docker.readthedocs.io

### run

```
docker-compose up
```
### service

ELASTICSEARCH_START: if set and set to anything other than 1, then Elasticsearch will not be started.

LOGSTASH_START: if set and set to anything other than 1, then Logstash will not be started.

KIBANA_START: if set and set to anything other than 1, then Kibana will not be started.

For example, the following command starts Elasticsearch only:
```
$ sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -it \
    -e LOGSTASH_START=0 -e KIBANA_START=0 --name elk sebp/elk
```

### Persisting log data

In order to keep log data across container restarts, this image mounts /var/lib/elasticsearch — which is the directory that Elasticsearch stores its data in — as a volume.

```
$ sudo docker run -p 5601:5601 -p 9200:9200  -p 5044:5044 -p 5000:5000 \
    -v elk-data:/var/lib/elasticsearch --name elk sebp/elk
```

This command mounts the named volume elk-data to /var/lib/elasticsearch (and automatically creates the volume if it doesn't exist; you could also pre-create it manually using docker volume create --name elk-data, use docker volumn ls you can keep trace volume).

可以通过 `docker volume rm elk-data` 删除

参看 host 路径

```
docker inspect elkdocker_elk_1
..
Mounts
```

### test

```
docker exec -it elkdocker_elk_1 /bin/bash
# start logstash
/opt/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { hosts => ["localhost"] } }'
```

2016.09.28
---

# Elasticsearch, Logstash, Kibana (ELK) Docker image

[![](https://badge.imagelayers.io/sebp/elk:latest.svg)](https://imagelayers.io/?images=sebp/elk:latest 'Get your own badge on imagelayers.io')

This Docker image provides a convenient centralised log server and log management web interface, by packaging Elasticsearch, Logstash, and Kibana, collectively known as ELK.

The following tags are available:

- `es240_l240_k460`, `latest`: Elasticsearch 2.4.0, Logstash 2.4.0, and Kibana 4.6.0.

- `es235_l234_k454`: Elasticsearch 2.3.5, Logstash 2.3.4, and Kibana 4.5.4.

- `es234_l234_k453`: Elasticsearch 2.3.4, Logstash 2.3.4, and Kibana 4.5.3.

- `es234_l234_k452`: Elasticsearch 2.3.4, Logstash 2.3.4, and Kibana 4.5.2.

- `es233_l232_k451`: Elasticsearch 2.3.3, Logstash 2.3.2, and Kibana 4.5.1.

- `es232_l232_k450`: Elasticsearch 2.3.2, Logstash 2.3.2, and Kibana 4.5.0.

- `es231_l231_k450`: Elasticsearch 2.3.1, Logstash 2.3.1, and Kibana 4.5.0.
 
- `es230_l230_k450`: Elasticsearch 2.3.0, Logstash 2.3.0, and Kibana 4.5.0.

- `es221_l222_k442`: Elasticsearch 2.2.1, Logstash 2.2.2, and Kibana 4.4.2.

- `es220_l222_k441`: Elasticsearch 2.2.0, Logstash 2.2.2, and Kibana 4.4.1.

- `es220_l220_k440`: Elasticsearch 2.2.0, Logstash 2.2.0, and Kibana 4.4.0.

- `E1L1K4`: Elasticsearch 1.7.3, Logstash 1.5.5, and Kibana 4.1.2.

**Note** – See the documentation page for more information on pulling specific combinations of versions of Elasticsearch, Logstash and Kibana.

### Documentation

See the [ELK Docker image documentation web page](http://elk-docker.readthedocs.io/) for complete instructions on how to use this image.

### Docker Hub

This image is hosted on Docker Hub at [https://hub.docker.com/r/sebp/elk/](https://hub.docker.com/r/sebp/elk/).

### About

Written by [Sébastien Pujadas](https://pujadas.net), released under the [Apache 2 license](https://www.apache.org/licenses/LICENSE-2.0).


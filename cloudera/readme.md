Cloudera
===

08.11
---

[Docker — How to Get Started With Cloudera](https://dzone.com/articles/docker-how-to-get-started-with-cloudera)

```
docker run --privileged=true \
    -ti -d \
    -p 8888:8888 \
    -p 80:80 \
    -p 7180:7180 \
    --name $1 \
    --hostname=quickstart.cloudera \
    -v /c/Users:/mnt/Users \
    $cd_image \
    /usr/bin/docker-quickstart
```

begin
---

import data

```
[cloudera@quickstart ~]$ sqoop import-all-tables \
    -m 1 \
    --connect jdbc:mysql://quickstart:3306/retail_db \
    --username=retail_dba \
    --password=cloudera \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --hive-import
```

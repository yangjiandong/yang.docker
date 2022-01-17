## sonarqube

### use docker-compose

- pg 14.1
- pgweb
- sonar 9.2.4-community

access pg

- psql

```
docker exec -it sonar_pg /bin/bash
psql -U root -d pdata
```

- pgweb
  - Scheme: `postgres://root:123@pg_db:5432/pdata?sslmode=disable`

### docker in centos7

- `mkidr my`, data,logs,conf, extensions
- `chmod -vR 777 ./my`

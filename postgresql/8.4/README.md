postgresql 8.4
===

psql
----

恢复老三环境

- create user, db
    - `docker exec -it postgresql8 createuser -U postgres -P root`
    - `docker exec -it postgresql8 createdb -E UNICODE -U root jsalary`
- load data
    ```
    $ docker exec -it postgres-container bash
    cd /var/lib/postgresql/data/
    psql -U root jsalary<back.txt
    ```

参考

- 进入容器
```
$ docker exec -it postgres-container bash
# su postgres
$ psql
```

- create db
    - `docker exec -it postgres-container createdb -U postgres my-db`
    - in container, use psql, `CREATE DATABASE jsalary ENCODING 'UTF8';`
- `\list`, list database
- `\c database`, use database
- `\i /temp/back.txt`, load data to datebase


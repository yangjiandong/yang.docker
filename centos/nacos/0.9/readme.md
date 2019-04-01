nacos 0.9
---

### run

- example
- nohup 安装, `yum install coreutils`
- standalone-derby
  ```
  cd example
  docker-compose -f standalone-derby.yaml up
  # stop
  # docker-compose -f standalone-derby.yaml down
  ```

- stndalone-mysql

  - 参考 mysql

    ```shell
    docker run --name mysql5.7 \
      -v $(pwd)/mysql:/var/lib/mysql \
      -v $(pwd)/conf:/etc/mysql \
      -p 3306:3306 \
      -e 'MYSQL_ROOT_PASSWORD=123' \
      -d \
      one/mysql:5.7 \
      --max-connections=500
    ```

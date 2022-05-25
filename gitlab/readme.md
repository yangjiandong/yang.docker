## 41 方案

- run.sh

  ```
  #! /bin/bash

  # --cpus=4 \
  # -m 12G --memory-swap 16G \

  docker run -d \
    -p 4000:80 \
    --privileged=true \
    --name gitlab \
    -v $(pwd)/config:/etc/gitlab \
    -v $(pwd)/logs:/var/log/gitlab \
    -v $(pwd)/data:/var/opt/gitlab \
    --cpus=4 \
    twang2218/gitlab-ce-zh:10.5.1
  ```

`config/gitlab.rb`

- 日志切割
  ```
  # 下面的参数均为默认值
  logging['logrotate_frequency'] = "daily" # 每天切割一次日志
  logging['logrotate_size'] = nil # 不按照默认值的大小切割日志
  logging['logrotate_rotate'] = 30 # 日志文件保留30天
  logging['logrotate_compress'] = "compress" # 使用'man logrotate'查看详情
  logging['logrotate_method'] = "copytruncate" # 使用'man logrotate'查看详情
  logging['logrotate_postrotate'] = nil # 默认没有postrotate(切割后执行的)命令
  logging['logrotate_dateformat'] = nil # 指定日志文件名格式(默认是数字表示)，比如该值修改为 "-%Y-%m-%d" ，那么切割的日志文件名为 production.log-2016-03-09.gz
  ```
- 调整，[参考](https://www.shaobin.wang/post/18.html), config/gitlab.rb
  - 减少数据库并发数, `postgresql['max_worker_processes'] = 8`
  - 减少进程数, `unicorn['worker_processes'] = 2`
  - 减少数据库缓存, `postgresql['shared_buffers'] = "128MB"`
  - 减少 sidekiq 并发数, `sidekiq['concurrency'] = 12`
  - 完整文件参考 `gitlab.rb`

## GitLab Community Edition (中文社区版)

- [gitlab-ce-zh](https://github.com/twang2218/gitlab-ce-zh)
- 自己构建
- 或直接拉取 `docker pull twang2218/gitlab-ce-zh:10.5.1`
- 采用 docker-compose 方式启动
  - start: `docker-compose up -d`
  - stop: `docker-compose down`

现在部署方案采用该版本

## sameersbn

- [sameersbn](https://github.com/sameersbn/docker-gitlab#internal-redis-server)
- start: `docker-compose up`
- 自己构建没成功，直接 pull

```
docker pull sameersbn/gitlab:10.5.1
```

- docker-compose `wget https://raw.githubusercontent.com/sameersbn/docker-gitlab/master/docker-compose.yml`, 调整下目录

- 直接运行 `docker-compose up`
- `http://localhost:10080` and login using the default username and password:

  username: root
  password: 5iveL!fe

- update root pwd: `qaz123456789`
- stop `docker-compose down`

- 能在内网正常运行，通过 nginx 代理必须是 root

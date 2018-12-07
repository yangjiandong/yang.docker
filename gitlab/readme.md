
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

- 调整，[参考](https://www.shaobin.wang/post/18.html), config/gitlab.rb
  - 减少数据库并发数, `postgresql['max_worker_processes'] = 8`
  - 减少进程数, `unicorn['worker_processes'] = 2`
  - 减少数据库缓存, `postgresql['shared_buffers'] = "128MB"`
  - 减少sidekiq并发数, `sidekiq['concurrency'] = 12`

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
- 自己构建没成功，直接pull

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

- 能在内网正常运行，通过 nginx 代理必须是root

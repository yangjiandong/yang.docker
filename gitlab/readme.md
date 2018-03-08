
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

## GitLab Community Edition (中文社区版)

- [gitlab-ce-zh](https://github.com/twang2218/gitlab-ce-zh)
- 自己构建
- 或直接拉取 `docker pull twang2218/gitlab-ce-zh:10.5.1`
- 采用 docker-compose 方式启动
    - start: `docker-compose up -d`
    - stop: `docker-compose down`
ngixn 1.12
---

### use

- run.sh

  ```
  docker run \
    -d \
    --name nginx \
    -p 8888:80 \
    -v $(pwd)/conf:/etc/nginx:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -v $(pwd)/www:/usr/share/nginx/html \
    -v $(pwd)/workspace:/app \
    one/nginx:1.12
  ```

  如果要 ssh 登录 container, 增加 `-p 4426:22`, ssh 登录命令 `ssh localhost -p 4426`, 密码 `123456`

### 说明

- www

  默认首页
  
- config
  - default: conf/conf.d/default.conf
  - 自定义项目: conf/cond.d/app.conf
- worksapce

  挂载点，对应 /app

- logs

  日志，根据cron，每天自动分割


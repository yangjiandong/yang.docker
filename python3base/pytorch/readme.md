# pytorch docker

## Docker

### [VSCode+Docker: 打造最舒适的深度学习环境](https://zhuanlan.zhihu.com/p/80099904)

use vscode remote ssh 功能

#### use one/centos:7

- one/centos:7
  - run.sh

  ```
  docker run --rm -it \
  -e TZ=Asia/Shanghai \
  -p 4426:22 \
  -p 9111:9111 \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
  --privileged=true \
  --name centos7 \
  one/centos:7
  ```

#### 设置免密登录

- 本地

  ```
  cd ~/.ssh
  ssh-keygen -b 4096 -t rsa
  # 回车、密码留空
  ```

- in one/centos:7 container

  ```
  cd
  mkdir .ssh
  touch .ssh/authorized_keys
  # x is 本地 ~/.ssh/id_rsa.pub 内容， use cat id_rsa.pub show infos
  echo "x" > .ssh/authorized_keys
  chmod 700 ~/.ssh/
  chmod 600 ~/.ssh/authorized_keys
  ```

  再重新 ssh 连接

### [ufoym/deepo](https://github.com/ufoym/deepo)

这个不版本还是值得看看，各种支持包比较多

#### GPU

#### CPU

- docker image, `docker pull ufoym/deepo:cpu`
- run, `docker run -it -v /host/data:/data -v /host/config:/config ufoym/deepo:cpu bash`

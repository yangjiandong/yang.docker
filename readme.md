Docker
===

tips
---

### docker registry mirrors
- https://exomynm5.mirror.aliyuncs.com
- https://registry.docker-cn.com

### py3base:3.6

- jupyter_notebook
- 混淆代码保护, `RUN pip3 install pyarmor`, use `py3base:3.6.1`

11.13
---

### pandoc 2.0

- add `multimarkdown`
- pandoc remove `latex-formulae-pandoc`
- add gitbook
- gitbook pdf , ok
  - as root run ebook-convert, `Running as root without --no-sandbox is not supported`
  - 参考 `https://hub.docker.com/r/beeronbeard/docker-gitbook-pdf/dockerfile`
  - add `ENV QTWEBENGINE_DISABLE_SANDBOX 1`
  
10.18
---

### pytorch

- `python3base/pytorch`

10.06
---

### [imgdupes](https://github.com/knjcode/imgdupes)

查找重复图片

After feature extracted, use image hash or image perceptual hash to generate image hash, and use Hamming distance to measure image similarity.

提取特征后，可以结合图像哈希以及图像感知哈希技术生成图像哈希，使用汉明距离进行图像的相似性度量。

- docker, in mac

  ```
  $ docker pull knjcode/imgdupes
  $ alias imgdupe="docker run -it -v $PWD:/app knjcode/imgdupes"
  $ imgdupe -rc /app/Downloads/FireShot/my phash 4
  ```

  查找相似，`imgdupe -rc /app/Downloads/FireShot/my phash 4 --query /app/Downloads/FireShot/my/33333.jpg`

### Cookiecutter

生成 python 项目规范目录结构

- `python3base/cookiecutter/u_data`
- 暂时没看出有什么使用场景，还是使用 python-v3.6.6

#### [use docker compose](https://github.com/lorarjohns/cookiecutter_compose)

```
pip install cookiecutter
cookiecutter https://github.com/lorarjohns/cookiecutter_compose.git
```

or use u_data

```
# build docker
make build
# run docker
make up
# access bash shell within the container
make bash
# start jupyter
jupyter notebook --ip 0.0.0.0 --allow-root
```

- todo
  - [](https://github.com/explosion/spacy-models)

#### [use docker](https://github.com/docker-science/cookiecutter-docker-science)

09.20
---

### jmeter

- [A Docker solution to JMeter + InfluxDB + Grafana performance testing](https://medium.com/@ellenhuang523/a-docker-solution-to-jmeter-influxdb-grafana-performance-testing-568848de7a0f)
  - [](https://github.com/jlight99/docker-jig)
- jmeter
- run

  ```shell
  docker-compose up
  docker-compose down
  ```

08.12
---

### Octave

- [类似 maltab，开源统计软件](https://github.com/lujun9972/linux-document/blob/master/tools/3%20open%20source%20alternatives%20to%20MATLAB.org)
- python3base/jupyterlab
- python3base/ubuntu

### matplotlib 图表 中文字体

  ```python
  from matplotlib.font_manager import FontProperties
  font= FontProperties(fname=r"Songti.ttc", size=12)
  ...
  plt.title('中国\n' + note, fontproperties=font)
  ```

08.11
---

### Python-for-Epidemiologists

- use ubuntu:bionic
- python3base/ubuntu

06.14
---

### searx

- [参考](https://hub.docker.com/r/wonderfall/searx/)
- 互联网元搜索引擎 Searx
- python3base/searx

05.27
---

### one/nginx:1.12

base on one/centos:7

05.26
---

### one/centos7

- base million12/centos-supervisor:4.0.2
- 放弃原有 one/centos7.6, 构建有问题

05.21
---

### nvm

- node/nvm

### update relaxedjs

- [参考 relaxed-docker](https://github.com/WeihanLi/docker-env/blob/master/docker-puppeteer/node10/stable.Dockerfile)，由于访问不了 google，直接使用 [puppeteer docker](https://hub.docker.com/r/weihanli/puppeteer/tags)
- use
  - create alias

  ```
  alias relaxed-docker="docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) --name relaxed one/relaxedjs:node10-stable $@"
  ```
  - goto examples dir

  ```
  relaxed-docker book.pug
  ```

05.18
---

### relaxedjs

- node/relaxedjs
  - alphine 下运行，chromimu 问题，不能正常使用

04.25
---

### jupyterLab add octave

- [](https://github.com/calysto/octave_kernel)

03.30
---

### nacos 0.9 base one/java:8

- [参考 nacos-docker](https://github.com/nacos-group/nacos-docker)
- 注意，centos6.9 采用了 `supervisord`，需好好利用
- nohup 安装, `yum install coreutils`

03.22
---

### jupyterLab

- python3base/jupyterLab
- run

  - in container, `sh /run_jupyter.sh`
  - open brower, `http://localhost:8888/lab`, pwd=123
- install plugins
  - @jupyterlab/latex

- 参考
  - https://github.com/facebookresearch/maskrcnn-benchmark
  - [mask-rcnn benchmark & docker & jupyterlab](https://zhuanlan.zhihu.com/p/55516749)

03.21
---

### aws openjdk，corretto-8

- build, `docker build -t amazon-corretto-8 github.com/corretto/corretto-8-docker`
- run, `docker run -it amazon-corretto-8`
- create, centos/corretto-8

  ```conf
  FROM amazonlinux:2
  RUN yum -y update \
  && amazon-linux-extras enable corretto8 \
  && yum -y install java-1.8.0-amazon-corretto-devel \
  && yum clean all

  ENV LANG zh_CN.utf8

  ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64
  ```

03.11
---

### npm

- nodejs/npm
  - node: 11.11.0, npm: 6.7.0
  - use my-vli3-app as app
  - ? 代码全部打包，docker 中有源码
- [如何使用 docker 部署前端应用](https://juejin.im/post/5c83cbaa6fb9a04a0f65fdaa)

03.06
---

### ffmpeg 4.1

- base centos:7.6
- centos/ffmpeg/4.1
- [use 参考](https://hub.docker.com/r/jrottenberg/ffmpeg)

02.23
---

### pandoc

base on latex

- 1.9, base latex-2015
- 2, base ubuntu:18.10, have: python2,python3.6
  - [thomasweise/docker-pandoc](https://hub.docker.com/r/thomasweise/docker-pandoc/dockerfile)
  - [thomasWeise-github](https://github.com/thomasWeise/docker-pandoc)
  - ttf-wqy-microhei(文泉驿微黑字体库), 字体定义 `/usr/share/texlive/texmf-dist/tex/latex/ctex/fontset`, 主要中文字体
  - out pdf, `pandoc --toc --toc-depth=3 -f markdown  readme.md --pdf-engine=xelatex -V mainfont="WenQuanYi Micro Hei" -o readme.pdf`
  - list fonts, `fc-list`
- pandoc + latex 中文方案，use `one/pandoc:2.0`，步骤
  - run docker

    ```
    docker run \
    --rm -it \
    -v $(pwd)/works:/source \
    one/pandoc:2.0 \
    /bin/bash
    ```

  - in container

    ```
    # 如果想重新设置中文字体
    # -V CJKmainfont="WenQuanYi Micro Hei" \
    # 设置英文字体，中文字体在my.tex 设置
    # -V mainfont="Georgia" \
    pandoc --toc --toc-depth=3 readme.md --pdf-engine=xelatex \
    --template=my.tex \
    -V CJKmainfont="AR PL UMing CN" \
    -V mainfont="Georgia" \
    -o readme3.pdf
    ```

  - 中文字体
    - `WenQuanYi Zen Hei` - zhhei
    - `AR PL UMing CN` - zhsong
    - `AR PL UKai CN` - zhkai
  - 模版 `templates/my.tex`

02.22
---

### keras

base python 3.6, use
- python3base/keras
- keras
- tensorflow
- [A neural network that transforms a design mock-up into a static website](https://github.com/emilwallner/Screenshot-to-code), 深度学习，设计稿转换代码
- run

  ```shell
  sh run.sh
  #进入容器，运行 jupyter,
  sh /run_jupyter.sh
  # brower, localhost:8888, 根据提示拷贝url 访问
  ```

01.17
---

### nginx1.12, openresty1.13.6

- base one/centos:7.6
- use supervisor, crond, logrotate, 提供日志分割功能
- hide nginx version, nginx.conf

  ```conf
  http {
    # do not show the nginx version
    # use curl -I http://localhost
    server_tokens   off;
  ```
- centos/nginx, openresty/1.13.6
- 具体参看 openresty/1.13.6/readme

2019.01.08
---

### centos7

one/centos:7.2 - 7.6
- sshd, port 22
- [centos7 + supervisor](https://blog.csdn.net/lemontree1945/article/details/80508443)
- use supervisor 启动多个应用
  - 镜像 CMD 只能执行一次，考虑以后会出现各种应用启动，所以采用 supervisor 方式启动应用
  - docker 启动supervisor, `CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf`
  - use ssh see container, `ssh root@localhost -p 4426`, passwd:123456,
    - 查看 supervisor, `supervisorctl -c /etc/supervisor/supervisord.conf status`
    - start, `supervisorctl -c /etc/supervisor/supervisord.conf start nginx`
- use cronie
  - centos7.6 只增加cron package，没具体安排任务
  - openresty 定义 cron

### tsung

- base one/centos7.6
- [参考](https://juejin.im/entry/56fb58c02e958a005944f063)
- [Dataman-Cloud git](https://github.com/Dataman-Cloud/OpenDockerFile)
- tsung/readme.md

12.07
---

### mindoc

Golang实现的基于beego框架的接口在线文档管理系统 https://www.iminho.me

- docker pull daocloud.io/lifei6671/mindoc:latest

11.20
---

### [sentry](https://github.com/getsentry)

Sentry 是一个实时的事件日志和聚合平台，基于 Django 构建。

- redis, start
- postgresql, start
- mail, start
- [sentry docker offical](https://github.com/getsentry/onpremise)
  - clone this repos
  - make build
  - 第一次运行
    - create_secret-key.sh, 得到 key，拷贝到启动脚本
    - 每次新版本第一次运行前运行: run_migratins.sh
    - run_command.sh, createuser, 新建用户: admin@gmail.com, admin
   - run.sh, start web
  - 启动, run.sh

- 注意 `--detach`, 命令行后台运行

08.17
---

### latex

- [blang/latex:ctanfull - Dockerfile.full](https://github.com/blang/latex-docker/blob/master/Dockerfile.full)full CTAN TexLive Scheme-full: Up-to-date, all packages (5.6GB)
- `docker pull blang/latex:ctanfull`

08.14
---

### portainer

- Docker可视化管理工具的安装配置及使用
- [官网](https://www.portainer.io/)
- portainer/run.sh
- user: admin,123456789

08.08
---

### openresty 1.13.6

- [base centos7](https://github.com/openresty/docker-openresty/blob/master/centos/Dockerfile)
- `docker pull openresty/openresty:1.13.6.2-centos`

### 与 Docker 使用的网络瓶颈

- [参考](http://wiki.jikexueyuan.com/project/openresty/web/docker.html)
- `docker run -d --net=host openresty/openresty:1.13.6.2-centos`

07.24
---

### 3.7.7-management

`docker pull rabbitmq:3.7.7-management`

### mongo

`docker pull mongo:3.6.6`

### nginx:1.14


07.17
---

### oracle 11g

- [docker-oracle-ee-11g](https://github.com/MaksymBilenko/docker-oracle-ee-11g)
- run

  ```shell
  docker run \
  -d \
  --name ora11g \
  --privileged=true \
  -p 8080:1158 -p 1521:1521 \
  -v $(pwd)/oracle/data:/u01/app/oracle \
  -h ora11g one/ora11g
  ```

  in win10, 共享目录路径问题还没解决，展示只能设置为 `oradata`, 具体路径还不知在哪

  ```shell
  rem 本地计算机策略 - 计算机配置 - windows 设置 - 安全设置 - 本地策略 - 安全选项 - 网络访问: 本地帐户的共享和安全模型 - 经典
  docker run -d ^
  --name ora11g ^
  -v oradata:/u01/app/oracle ^
  -e CHARACTER_SET=ZHS16GBK ^
  -p 8001:1158 -p 1522:1521 ^
  -h ora11g-gbk one/ora11g
  ```

- oracle

  ```conf
  hostname: 192.168.1.41
  port: 1521
  sid: EE
  service name: EE.oracle.docker
  username: system(sys)
  password: oracle
  ```

- use

  ```sql
  create tablespace tsp_hcost
  datafile '/u01/app/oracle/oradata/EE/aphcost.dbf'
  size 100M
  reuse
  autoextend on
  next 50M;

  CREATE USER "HCOST"
    PROFILE "DEFAULT" IDENTIFIED BY "123"
    DEFAULT TABLESPACE "TSP_HCOST" TEMPORARY TABLESPACE "TEMP"
    ACCOUNT UNLOCK;

   GRANT "DBA" TO "HCOST";
   GRANT "CONNECT" TO "HCOST";
   GRANT "RESOURCE" TO "HCOST";
   ```

  remove old data
  ```sql
  drop tablespace cdr including contents and datafiles cascade constraint;

  CREATE TABLESPACE cdr
  LOGGING
  DATAFILE '/u01/app/oracle/oradata/EE/CDR.DBF'
  SIZE 2048M
  AUTOEXTEND ON
  NEXT 1024M MAXSIZE UNLIMITED
  EXTENT MANAGEMENT LOCAL AUTOALLOCATE SEGMENT SPACE MANAGEMENT AUTO;
  ```

- em 过段时间失效，下次进了就没启动

  找不到 `/u01/app/oracle/product/11.2.0/EE/oc4j/j2ee/OC4J_DBConsole_b0482d3bf9ab_EE`

  - use one/ora11g run
  - 重新生成镜像 `docker commit ora11g one/ora11g.2`
  - run from one/org11g.2
  - docker exec -it orac11g /bin/bash
    - su oracle
    - emctl start dbconsole

  - 但过段时间还是会失效
    - emctl status dbconsole

      ...
      EM Daemon is not running.
    - 重新配置: emca -config dbcontrol db -repos recreate, 没解决

  - q
    - user root run: lsnrctl start
    - /network/admin/listener.ora
      (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=ora11g)(PORT=1521)))
    - /u01/app/oracle/product/11.2.0/EE/ora11g_EE/sysman/logs, tail -f emagent.trc

- start em
  - 11g,use: emctl start(stop,status) dbconsole
  - 12,use: exec dbms_xdb_config.sethttpport(1158)
- 内存 ?

- [oracle Official](https://github.com/oracle/docker-images/tree/master/OracleDatabase)
- TZ='Asia/Shanghai' date
- 字符集
  ```sql
  select * from nls_database_parameters;
  ```

07.03
---

### python 3.6

- base debian 9.4, stretch (cat /etc/debian_version)
- [参考](https://hub.docker.com/r/library/python/tags/)
- one/py3base:3.6
- 进入容器，运行 jupyter, `sh /run_jupyter.sh`
- brower, localhost:8888

### turiCreate

- turiCreate.iOS的机器学习
- [如何用Python和深度神经网络寻找近似图片？](https://www.jianshu.com/p/6fe5c75a8aa5)

05.24
---

### latex

参考 [blang latex docker](https://github.com/blang/latex-docker)

- base ubuntu 16.04(base/ubuntu/1604)

  or `docker pull blang/latex:ubuntu`, full `docker pull blang/latex:ctanfull`

- [上海交大](http://www.latexstudio.net/archives/12480)
  - shjd/Dockerfile

05.11
---

### 补充

- 增加docker 可用连接端口数，方便docker 访问外部，可用来模拟多客户

  ```shell
  docker run --rm \
    -it \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
    one/centos:6.9 \
    /bin/bash
  ```

  查看 in container, `cat /proc/sys/net/ipv4/ip_local_port_range`,`sysctl -a | grep ipv4.ip_local_port_range`

- 增加docker 打开文件数

  - `--ulimit nofile=65536:65536`
  - update to `--ulimit nofile=1048576:1048576`
  - one/centos7.6, 默认就 `1048576`(有可能和宿主机有关, fs.file-max=1048576)

  查看 in container, `ulimit -n`

04.24
---

### `one/java8:1.0· to `one/java:8`

base on one/java:8, create one/java-media:8
- imageMagick
- `docker run --rm -i -t  -v (pwd)/work:/work one/java-media:8  /bin/bash`

调整，直接修改 centos6.9，增加 imageMagick 包

04.17
---

monitor `docker stats`

### docker 监控

- cAdvisor: Google开源的用于监控基础设施应用的工具，它是一个强大的监控工具，不需要任何配置就可以通过运行在Docker主机上的容器来监控Docker容器，而且可以监控Docker主机。更多详细操作和配置选项可以查看Github上的cAdvisor项目文档。
- influxDB: 它是一个分布式时间序列数据库。cAdvisor仅仅显示实时信息，但是不存储监视数据。因此，我们需要提供时序数据库用于存储cAdvisor组件所提供的监控信息，以便显示除实时信息之外的时序数据。
- Grafana: Grafana可视化展示平台允许我们可视化地展示监控信息。它允许我们对influxDB进行查询，并通过强大的图表功能进行可视化展示。

use:
- `docker pull tutum/influxdb`, `run_influxdb.sh`, 注意 linux 下建立卷需增加 `--privileged=true`
  - access url: http://ip:8083
  - `CREATE DATABASE "cadvisor"`
  - `CREATE USER 'cadvisor' WITH PASSWORD 'cadvisor'`
  - `grant all privileges on "cadvisor" to "cadvisor"`
  - `grant WRITE on "cadvisor" to "cadvisor"`
  - `grant READ on "cadvisor" to "cadvisor"`

- [参考](https://www.jianshu.com/p/d078d353d12f)
- (https://my.oschina.net/hansonwang99/blog/1796507)
- [monitoring-docker-containers](https://blog.codeship.com/monitoring-docker-containers/)

- run_cadvisor.sh, mac 下部署有点问题
- use grafana

### 最终部署方案

- `monitor/dockprom`

04.16
---

### postgresql 8.4

- [8.4](https://github.com/pcorace/postgresql-8.4-docker)

04.15
---

### nginx

```
git pull nginx
```

监控: Amplify is a free monitoring tool that can be used to monitor microservice architectures based on nginx. Amplify is developed and maintained by the company behind the nginx software.

```
git clone https://github.com/nginxinc/docker-nginx-amplify.git
cd docker-nginx-amplify
docker build -t nginx-amplify .
```

04.10
---

### centos 6.9 时区时间问题

时区

```
# Time Zone
RUN echo 'ZONE="Asia/Shanghai"' > /etc/sysconfig/clock
ENV TIME_ZONE "Asia/Shanghai"
RUN rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && \
    echo $TIME_ZONE > /etc/timezone
```

时间 总算相差3 分钟

```
-v $(pwd)/Shanghai:/etc/localtime \
```

03.30
---

### 区块链 Hyperledger Fabric

- [面向 Java 开发人员的区块链链代码](https://www.ibm.com/developerworks/cn/java/j-chaincode-for-java-developers/index.html)
- `docker pull hyperledger/fabric-membersrvc`, `hyperledger/fabric-peer:x86_64-1.1.0`
- hyperledger/
  `docker-compose up`
- `mkdir -p $GOPATH/src/github.com/hyperledger`
- `cd $GOPATH/src/github.com/hyperledger`

03.27
---

### spring boot 监控 Prometheus & grafana

- [Prometheus](https://prometheus.io/)
- [Prometheus 采集 Spring Boot 指标数据](http://www.spring4all.com/article/265)
- [Prometheus docker](https://hub.docker.com/r/prom/prometheus/)

```
docker pull prom/prometheus
docker pull grafana/grafana
```

- `prometheus/run.sh`, access to `http://localhost:9090`, user: admin,admin
- `prometheus/grafana/run.sh`, access to `http://localhost:3000`

03.07
---

### gitlab

#### 41 方案

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

#### test

[docker](https://github.com/sameersbn/docker-gitlab)

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
  - youngjiandong@sina.cn, qaz123456789

### base:v3

yangjiandong/base:v3 to one/base:v3

### base/ubuntu/1604


2018.02.27
---

### fastdfs

[docker for fastdfs tracker](https://github.com/phinexdaz/fdfs_tracker)

10.10
---

## onlyoffice/documentserver

文档服务

- `docker pull onlyoffice/documentserver`
- `docker run -i -t -d -p 9000:80 onlyoffice/documentserver`, 看到502报错，稍等

Document Server的数据在容器中的储存位置如下：

- `/var/log/onlyoffice` 存放ONLYOFFICE Document Server日志
- `/var/www/onlyoffice/Data` 存放证书文件
- `sudo docker run -i -t -d -p 80:80 \
    -v /app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice  \
    -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver`

[参考](https://www.orgleaf.com/2588.html)

## Nextcloud

网盘方案，有各种插件，支持移动端

- [github](https://github.com/nextcloud)
- [docker](https://hub.docker.com/_/nextcloud/)

- `docker pull nextcloud`
- `docker run -d -p 8080:80 nextcloud`
- [markdown 插件](https://apps.nextcloud.com/apps/files_markdown)
- [客户端](https://download.nextcloud.com/desktop/releases/)

授权请求问题，没解决，[资料](http://www.jianshu.com/p/bc2bb6dd7c6e)

- 另一个方案 [wonderfall/nextcloud](https://hub.docker.com/r/wonderfall/nextcloud)
- [Aria2-AriaNg-X docker-compose](https://github.com/wahyd4/aria2-ariang-x-docker-compose)

  git clone https://github.com/wahyd4/aria2-ariang-x-docker-compose.git

- [wonderfall/nextcloud](https://hub.docker.com/r/wonderfall/nextcloud/)

  docker pull wonderfall/nextcloud

### docker-compose 安装方式

- `https://github.com/nextcloud/docker`
- nextcloud/compose

0914
---

## nodejs

https://hub.docker.com/_/node/

- nodejs 8.5

0913
---

## tensorflow

-> python3base:v3 -> base:v3

- 重新构建 python3 , 采用 unbutn 16.04 python 3.5
- 暂时手工运行 jupyter, `sh /run_jupyter.sh`

ip hosts:

```
#TensorFlow start
64.233.188.121 www.tensorflow.org
#TensorFlow end
```

0912
---

## opencv

from yangjiandong/py3base:v2

- opencv 3.2.0
- python3.5
- matplotlib

boost

安装报 `fatal error: pyconfig.h: No such file or directory`

参考 https://svn.boost.org/trac10/ticket/11120

手工进入docker，生成 `project-config.jam`

```
./bootstrap.sh --prefix=boost_output --with-icu= --with-python=python3
find /usr -name pyconfig.h
vi project-config.jam
//edit
using python : 3.5 : /usr/local : /usr/local/include/python3.5m ;
```

- face_recognition(人脸识别)

另一个版本

```
FROM ubuntu:16.04

# Install OpenCV
RUN apt-get update \
  && apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python3 python3-pip python3.5-dev wget unzip python3-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev \
  && cd /opt \
  && wget https://github.com/Itseez/opencv/archive/3.1.0.zip \
  && unzip 3.1.0.zip \
  && cd opencv-3.1.0 \
  && mkdir build \
  && cd build \
  && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. \
  && make -j7 \
  && make install \
  && cd .. \
  && rm -rf build \
  && apt-get remove -y unzip wget \
  && pip3 install scikit-image scipy beautifulsoup4 requests mahotas

CMD /bin/bash
```

0829
---

## docker-elk

[The ELK stack powered by Docker and Compose](https://github.com/deviantony/docker-elk)

- 5000: Logstash TCP input.
- 9200: Elasticsearch HTTP
- 9300: Elasticsearch TCP transport
- 5601: Kibana

现在采用docker-elk

0825
---

## elk

[Elasticsearch, Logstash, Kibana (ELK) Docker image](https://github.com/spujadas/elk-docker)

- docker pull sebp/elk
- docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk

    - 5601 (Kibana web interface).
    - 9200 (Elasticsearch JSON interface).
    - 5044 (Logstash Beats interface, receives logs from Beats such as Filebeat – see the Forwarding logs with Filebeat section).

0817
---

## apache

- from centos6.9
- apache2.2
- svn1.6
- php5.3

q:

Can't open file '/root/.subversion/servers': Permission denied)

[参考](http://www.wohenniucha.com/index.php/archives/90/)

解决

```
chmod 551 /root
```

0810
---

## cloudera

import

```
docker import - cloudera/quickstart:0810 < cloudera-quickstart-vm-*-docker/*.tar
```

run

```
docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 8888:8888 -p 80:80 -p 7180:7180 cloudera/quickstart:0810 /usr/bin/docker-quickstart
```

07.15
---

### one/debian:jessie

### redis3.2.9 from one/debian:jessie

### 最新Dockerfile

```
cetons/6.x
      /java8
      /openresty

mysql/5.7

```

07.04
---

### redis

https://hub.docker.com/_/redis/

06.29
---

### alisql, mysql

alisql docker

```
docker pull registry.cn-hangzhou.aliyuncs.com/acs-sample/alisql:latest
```

run

```
# custom mysql conf
docker run \
    --name alisql \
    -v $(pwd)/custom:/etc/mysql \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -d \
    registry.cn-hangzhou.aliyuncs.com/acs-sample/alisql:latest
```

```
# store data
docker run \
    --name alisql \
    -v $(pwd)/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123 \
    -d \
    registry.cn-hangzhou.aliyuncs.com/acs-sample/alisql:latest
```

```
# Creating database dumps
docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
```

client

```
mysql -uroot -p -h192.168.1.109
```

mysql sysbench 性能测试

```
brew install sysbench
```

utf8mb4

1.MySQL中的utf-8并不是真正意义上的utf-8,它只能存储1~3个字节长度的utf-8编码，而存储4个字节的必须用utf8mb4(mysql>=5.5.3支持)，否则会出现乱码。例如在微信管理系统中，消息文本使用了emoji表情:符号，必须使用utf8mb4进行储存。
2.注意最大字符长度：以INNODB为基础，utf8最长VARCHAR(255)，utf8mb4最长为VARCHAR(191)。
3.如果使用PHP来操作到 MySQL，字符串仍可能面临在数据库中以非 UTF-8 的格式进行存储的问题。
4.为了字符串从 PHP 到 MySQL都使用 UTF-8，确认数据表都设定为 utf8mb4 字符集和整理，并且确保 PDO 连接请求也使用了 utf8mb4 字符集,这是非常重要的。要求在的mysql>=5.5.3版本，表、字段必须使用utf8mb4字符集和utf8mb4整理。


06.28
---

### openresty

API statistics/summary and health datas in NGINX based on OpenResty/ngx_lua, just like NGINX Plus

```
git@github.com:iresty/Mio.git
```

wrk 压测

```
brew install wrk
```

06.23
---

### centos6,7

[163](https://c.163.com/hub#/m/repository/?repoId=1055)

one/centos:7.2 --> hub.c.163.com/public/centos:7.2.1511

- one/centos:7.2(centos/7.x)

仿照了 7.2-tools, yum 源更换为网易源，并安装了常用软件 openssh-server、supervisor、vim、tar、wget、curl、rsync、bzip2、iptables、tcpdump、less、telnet、net-tools、lsof、sysstat、cron。

- one/centos:6.9(centos/6.x)

注意：作为后台运行任务，centos7不能正常运行，6.9 正常

```
docker logs [container name]
```

进入后台运行的docker container

```
docker exec -it centos6.supervisor /bin/bash
```

运行步骤：

- run_supervisord.sh
- run_in_container.sh

05.20
---

### update python3base

[参考](https://github.com/ampervue/docker-python35/blob/master/Dockerfile)

- python 3.5.1
- imagemagick

### py3ffmpeg

[参考](https://github.com/ampervue/docker-ffmpeg/blob/master/Dockerfile)
[moviepy](https://github.com/ampervue/docker-ffmpeg-moviepy/blob/master/Dockerfile)

base on python3base

- ffmpeg
- moviepy

run

```
docker run --rm -ti dkarchmervue/moviepy ffmpeg -version
docker run --rm -ti -v ${PWD}:/work dkarchmervue/moviepy python your-moviepy-script.py
docker run --rm -ti dkarchmervue/moviepy bash
```

error:

```
[MoviePy] This command returned an error !Traceback (most recent call last):
...
convert: not authorized...
...
```

```
vim /etc/ImageMagick/policy.xml

change from <policy domain="path" rights="none" pattern="@*" /> to <!--<policy domain="path" rights="none" pattern="@*" /> -->.
```

2017.01.16
---

### ruby 2.3


12.02
---

### nodejs

[参考](https://by-example.org/install-node-js-6-on-ubuntu-16-04-xenial-xerus-lts/)

采用 node/base, ubunt 16.04, node 6.9

11.03
---

### docker 考虑磁盘容量

```
docker-machine create --virtualbox-disk-size "50000" --virtualbox-memory "4096" -d virtualbox dev
```

09.29
---

### git 删除历史文件

- 步骤一：从你的资料库中清除文件

```
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch path-to-your-remove-file' --prune-empty --tag-name-filter cat -- --all
#如果你看到类似下面这样的，就说明删除成功了：
Rewrite 48dc599c80e20527ed902928085e7861e6b3cbe6 (266/266)
# Ref 'refs/heads/master' was rewritten
```
- 推送我们修改后的 repo
```
git push origin master --force
```
- 步骤三：清理和回收空间
```
rm -rf .git/refs/original/

git reflog expire --expire=now --all

git gc --prune=now
Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (1378/1378), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1461), reused 1802 (delta 1048)
git gc --aggressive --prune=now
Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (2426/2426), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1483), reused 0 (delta 0)
```

09.14
---

### [phusion base image](https://github.com/phusion/baseimage-docker)

A minimal Ubuntu base image modified for Docker-friendliness

create base:v3

09.02
---

### elasticsearch 2.4

```
chmod +x docker-entrypoint.sh
mkdir esdata
chmod 777 esdata
```

### Elasticsearch, Logstash, Kibana (ELK) Docker image

- [github](https://github.com/spujadas/elk-docker)
- [docs](https://elk-docker.readthedocs.io/)
- elasticsearch/elk-docker/

```
$ sudo docker run -p 5601:5601 -p 9200:9200  -p 5044:5044 -p 5000:5000 \
    -v elk-data:/var/lib/elasticsearch --name elk sebp/elk
```

- 5601 (Kibana web interface).
- 9200 (Elasticsearch JSON interface).
- 9300 (Elasticsearch transport interface).
- 5044 (Logstash Beats interface, receives logs from Beats such as Filebeat – see the Forwarding logs with Filebeat section).
- 5000 (Logstash Lumberjack interface, receives logs from Logstash forwarders – see the Forwarding logs with Logstash forwarder section).

### Elk last

- [github](https://github.com/deviantony/docker-elk)
- elasticsearch/elk-docker-2
- [infos](http://www.infoq.com/cn/news/2016/08/Elasticsearch-5-0-Elastic)

08.29
---

### openresty add php5.6

08.25
---

### 容器间通讯

`-h HOSTNAME or --hostname=HOSTNAME` 设定容器的主机名，它会被写到容器内的 `/etc/hostname` 和 `/etc/hosts`。但它在容器外部看不到，既不会在 docker ps 中显示，也不会在其他的容器的 `/etc/hosts` 看到。

`--link=CONTAINER_NAME:ALIAS` 选项会在创建容器的时候，添加一个其他容器的主机名到 `/etc/hosts` 文件中，让新容器的进程可以使用主机名 ALIAS 就可以连接它。

`--dns=IP_ADDRESS` 添加 DNS 服务器到容器的 `/etc/resolv.conf` 中，让容器用这个服务器来解析所有不在 `/etc/hosts` 中的主机名。

`--dns-search=DOMAIN` 设定容器的搜索域，当设定搜索域为 `.example.com` 时，在搜索一个名为 host 的主机时，DNS 不仅搜索 host，还会搜索 `host.example.com`。 注意：如果没有上述最后 2 个选项，Docker 会默认用主机上的 `/etc/resolv.conf` 来配置容器。

08.23
---

### ubuntu time

You can make this change permanent for yourself by appending the line
       	TZ='Asia/Shanghai'; export TZ
to the file '.profile' in your home directory; then log out and log in again.

Here is that TZ value again, this time on standard output so that you
can use the /usr/bin/tzselect command in shell scripts:
Asia/Shanghai

08.12
---

### spark 1.6

[参考](https://hub.docker.com/r/sequenceiq/spark/builds/birjne8ndykylp5si7u5qmt/)
[1.6](https://hub.docker.com/r/sequenceiq/spark/tags/)

Hadoop 2.6.0 and Apache Spark v1.6.0 on Centos

参考 [1](https://github.com/sequenceiq/docker-spark) 构建自己的 docker, 不能运行，还是采用官方镜像`docker pull sequenceiq/spark:1.6.0`

- create java8/sprark:1.6.0 base sequenceiq/spark:1.6.0

```
# install java8
### Install Java with Alternatives
### dowload soft/jdk-8u66-linux-x64.tar.gz

tar xvf jdk-8u66-linux-x64.tar.gz /usr/java

After extracting Java archive file, we just need to set up to use newer version of Java using alternatives. Use the following commands to do it.

# cd /usr/java/jdk1.8.xx
# alternatives --install /usr/bin/java java /usr/java/jdk1.8.xx/bin/java 2
# alternatives --config java

Now you may also required to set up javac and jar commands path using alternatives command.

# alternatives --install /usr/bin/jar jar /usr/java/jdk1.8.xx/bin/jar 2
# alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.xx/bin/javac 2
# alternatives --set jar /usr/java/jdk1.8.xx/bin/jar
# alternatives --set javac /usr/java/jdk1.8.xx/bin/javac

### Check Installed Java Version

Uses following command to check which version of Java is currently being used by system.

# java -version

javaca version "1.8.xx"
```

- run

```
#spark/run.sh
docker run --name master -it -p 8088:8088 -p 8042:8042 -p 50070:50070 -p 8085:8080 -p 4040:4040 -p 7077:7077 -p 2022:22  -v ~/data:/data -v ~/data/log:/usr/local/hadoop/logs -h master java8/spark:1.6.0 bash
```

08.06
---

### docker 加速

[DaoCloud](https://dashboard.daocloud.io/)
user:youngjiandong@sina.cn,qazwsx

```
Docker Toolbox
docker-machine ssh default
sudo sed -i "s|EXTRA_ARGS='|EXTRA_ARGS='--registry-mirror=http://2c661460.m.daocloud.io |g" /var/lib/boot2docker/profile
exit
docker-machine restart default
```

### mysql

http://siddontang.com/2015/01/09/docker-practise/

Run the mysql image
```
docker run --name mysql -d yangjiandong/mysql:5.5
```

You can access the mysql server as the root user using the following command:
```
docker run -it --rm --volumes-from=mysql yangjiandong/mysql:5.5 mysql -uroot
```

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123' WITH GRANT OPTION;
flush privileges;

- 解决 mac 下 mysql 权限问题

[参考](http://www.cnblogs.com/yjmyzz/p/run-mysql-in-docker-using-mac.html)
[2](http://stackoverflow.com/questions/34442831/permission-denied-when-mounting-docker-volume-in-osx)

Dockerfile
```
RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chmod -R 777 /var/lib/mysql
```

mysql data store dir
```
cd
mkdir -p mysql_data/data
chmod 777 mysql_data
```

run.sh
```
docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d yangjiandong/mysql:latest
```

in run mysql container
```
docker exec -it mysql /bin/bash
```

07.28
---

[局域网访问 docker](http://www.jscon.cc/docker-serial-2/)

virtualbox 网络设置 - 网络地址转换 - 端口转发 add
```
nginx tcp 192.168.1.109 8080  8080
```

redis.dev - 可以用的 redis

07.20
---

json-server 修改了 json 需重新启动
```
docker stop my-json-server
docker rm my-josn-server
```

add `--watch` 好像没效果

old
---

### 07.18

config nginx + rtmp
```
copy install_rtmp_module.sh to /app
run docker
./install_rtmp_module
```

### 07.16

在 `yangjiandong/openresty` 基础上安装 `ffmpeg`， 准备安装 [nginx+rtmp 服务器](http://www.jianshu.com/p/02222073b3f1)

参考
- [centos7 install ffmpeg](http://www.icnws.com/articles/2016/02/29/1456739902248.html)
- [2](http://www.yaosansi.com/post/ffmpeg-on-centos/)

```
run yangjiandong/openresty
yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel
```

commit to yangjiandong/openresty_ffmpeg image
```
docker ps
docker commit 336600fa7f5c yangjiandong/openresty_ffmpeg
```

```
install libvpx 出现 Neither yasm nor nasm have been found
解决
./configure --prefix="$HOME/ffmpeg_build" --as=yasm --disable-examples

ffmpeg --version
ffmpeg: error while loading shared libraries: libmp3lame.so.0: cannot open shared object file: No such file or directory
解决
cd /
find -name libmp3lame.so.0
./root/ffmpeg_build/lib/libmp3lame.so.0
vi /etc/ld.so.conf,add
/root/ffmpeg_build/lib

ldconfig
```

test
```
ffmpeg -version
```

### 07.12

add openresty docker

[参考](https://github.com/openresty/docker-openresty)

### 07.07

```
Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": tls: DialWithDialer timed out
```

升级了 docker-toolbox 1.11 出现以上问题
[1](http://miroadamy.com/2016/03/docker-machine-error-after-upgrade)
```
docker-machine rm default
docker-machine create --driver virtualbox default
```

以前的 docker image 就没有了

#### Alpine

最小的 docker 镜像

### 06.17

#### elasticsearch

- [elasticsearch](http://segmentfault.com/a/1190000003111556?utm_source=Weibo&utm_medium=shareLink&utm_campaign=socialShare)

```
sudo docker run -d -p 9200:9200 -p 9300:9300 elasticsearch
```

- [Elasticsearch, Logstash, Kibana (ELK) Docker image documentation](https://elk-docker.readthedocs.io)

    For instance, the image containing Elasticsearch 1.7.3, Logstash 1.5.5, and Kibana 4.1.2 (which is the last image using the Elasticsearch 1.x and Logstash 1.x branches) bears the tag E1L1K4

```
docker pull sebp/elk:E1L1K4
docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -it --name elk sebp/elk:E1L1K4
# access 192.168.99.100:5601 kibana web interface
# lastest
docker pull sebp/elk
```

```
docker exec -it elk /bin/bash
/opt/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => localhost } }'
#192.168.99.100:9200/_search?pretty
```

- [github source](https://github.com/spujadas/elk-docker)
- [logstash elasticsearch kibana 日志集中解决方案](http://my.oschina.net/chaun/blog/670928)

### 05.28

docker 访问问题，虽然`docker inspect redis | grep IPA` 查看到了 IP，但访问不了，只能访问 `docker-machine env default` 显示的 ip

### 2016.02.22

rabbitmq

[参考](https://coderwall.com/p/uqp34w/install-rabbitmq-via-docker-in-os-x)

- docker ip `192.168.99.100`
- `docker pull rabbitmq:3.6.0-management`
- `docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=123 --name rabbitmq rabbitmq:3.6.0-management`, docker start rabbitmq
- `http://192.168.99.100:15672/`

### 12.09

```
docker run \
    --name fusion1api \
    --restart unless-stopped \
    --net=myapp \
    -d \
    -e MODULE=fusion \
    -v $FPATH/fusion1_api:/opt/django/app \
    fangzx/py27prd:3.0
```

反向代理我也用容器，配置文件中就直接可以用其他容器的名字

反向代理的容器运行命令

```
docker run \
    --name nrp \
    --net=myapp \
    --restart unless-stopped \
    -p 80:80 \
    -p 443:443 \
    -v $FPATH/logs:/var/log/nginx \
    -v $FPATH/conf/default.conf:/etc/nginx/conf.d/default.conf \
    -v $FPATH/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v $FPATH/certs:/etc/nginx/certs \
    -d \
    fangzx/nginxreverseproxy:1.0
```

- [豆瓣 code](https://github.com/douban/code)

You can use code

```
$docker pull dongweiming/code
or just build locally(recommended):
$cd code
$docker build -t code .
```

And launch a bash shell inside the container

```
$docker run -d -p 8080:8000 code gunicorn -w 2 -b 0.0.0.0:8000 app:app  # start app
5cf0d1f6a421c53d54662df77dd142978d24b8c76fd72ce1c106506458e1304a
$boot2docker ip
192.168.59.103
# go web http://192.168.59.103:8080
$docker run -t -i code /bin/bash
```

- error

    ```
docker dial tcp 192.168.99.100:2376: getsockopt: connection refused
    ```

    解决：

    ```
docker-machine stop default
docker-machine start default
    ```

### 12.08

- mac 采用 docker toolbox

    ```
docker-machine create -d virtualbox --virtualbox-boot2docker-url boot2docker.iso default
    ```

- java7base 无效

- [参考](https://hub.docker.com/r/stephenreed/jenkins-java8-maven-git/~/dockerfile/), java8base 增加了 jenkins

  - `docker-machine ip default`
  - brower to `http://ip:8080`

  > 注意：如果你在 OS X windows 或者 Linux 上使用 boot2docker 虚拟机，你需要获取虚拟机的 ip 来代替 localhost 使用，你可以通过运行 boot2docker shell 来获取 ip。

### 2015.08.26

#### redis


- get docker

    ```
docker pull redis:3.0.3
    ```

- run

    运行服务：

    ```
docker run --name redis -d -p 6379:6379 redis:3.0.3 -v ~/workspace/docker/redis-data:/data
    ```

    参数说明：

    - name 是给 container 取一个别名，以后再 stop 和 attach 的时候就可以使用这个别名，
    - d 是作为一个后台服务运行，
    - p 是端口映射，把 container 的 6379 映射到 host 的 6379 端口，

    这样就可以在 host 机上使用 192.168.59.103:6379 来连接 container 中的 redis 服务了。

    另一个容器访问 redis:

    ```
docker run --link redis:db --rm -i -t ubuntu:14.04 /bin/bash
    ```

    参数说明：

    - rm Automatically remove the container when it exits


### 2015.08.20

- create new image

`docker ps` - show container id
`docker commit <container id> images-id` - 可以覆盖原有 images

- export,save

```
# 容器的导出
docker export <CONTAINER ID> > /home/export.tar
```

```
# 保存镜像到文件，方便在另外机器上安装
docker save image_name > filename.tar
or
docker save image_name | gzip > filename.tar.gz
# 还原
docker load < filename.tar
```

- error

`An error occurred trying to connect: Get https://192.168.59.103:2376/v1.19/containers/json: x509: certificate is valid for 127.0.0.1, 10.0.2.15, not 192.168.59.103`

```
boot2docker ssh 'sudo /etc/init.d/docker restart'
```

- Remove all untagged images

```
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

```

- Stop / remove all Docker containers

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

- 查看容器内部详情细节

```
docker inspect <id/container_name>
```

- 进入运行的容器

```
docker attach f357e2faab77
```
or

in run container
```
docker exec -it [container name] /bin/bash
```

- 拷贝容器文件

```
docker cp <containerId>:/file/path/within/container /host/path/target
```

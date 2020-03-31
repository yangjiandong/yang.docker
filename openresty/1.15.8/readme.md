# openresty 1.15.8

## docker base centos:7

1.13.6 base centos:7.6

## use

### supervisorctl

in container
- supervisorctl, restart nginx

报错查找，`supervisorctl tail nginx stderr`

### 增加图片输出多尺寸功能

- run.sh, `-v $(pwd)/static://usr/share/nginx/html/front/static`
- use
  - `http://localhost:8888/front/static/demo/ad1.jpg`
  - `http://localhost:8888/front/static/demo/ad1.jpg!300x200`

- 找不到 `image_filter` module

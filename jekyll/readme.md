jekyll
===

构建官方 docker 没有成功

参考 `http://blog.nimbleci.com/2016/08/10/how-to-deploy-a-jekyll-blog-in-docker/`

采用 `https://github.com/mzlogin/mzlogin.github.io` 作为测试

更改项目目录，如下：

```
.
├── app
│   ├── _drafts
│   ├── _includes
│   ├── _layouts
│   │   ├── default.html
│   │   └── post.html
│   ├── _posts
│   ├── css
│   ├── images
│   ├── index.html
│   ├── js
│   └── robots.txt
├── _config.yml
├── Dockerfile
├── Gemfile
└── web
```

运行：

```
docker run --rm \
         -v "$(pwd):/src" \
         -w /src \
         ruby:2.3 \
         sh -c 'bundle install \
             --path vendor/bundle \
             && exec jekyll build --watch'
```

注意修改 `_config.yml`

```
source: app
destination: web
```

生产 web项目，配置 nginx.conf

```
    server {
        listen 6699;

        include             settings.conf;
        include             locations.conf;

    }

```


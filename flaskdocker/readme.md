使用 Docker 进行 web 开发
---

构建

    docker-compose up

运行

    docker-compose run web env

停止

    docker-compose stop


delete image
```
docker rmi -f image
```

注意，port 映射需
```
boot2docker ssh -L 8000:localhost:8000 
```

参考
---

http://blog.carbonfive.com/2015/03/17/docker-rails-docker-compose-together-in-your-development-workflow/



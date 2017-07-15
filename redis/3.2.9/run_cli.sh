docker run -it \
    --link redis:redis \
    --rm \
    one/redis:3.2.9 \
    redis-cli -h redis -p 6379

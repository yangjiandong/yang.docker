#redis-server /data/redis.conf

docker run --name redis \
        --rm \
        -d \
        -p 6379:6379 \
        -v $(pwd)/data:/data \
        one/redis:3.2.9 redis-server 

#redis-server /data/redis.conf

docker run \
  --detach \
  --name sentry-redis \
  -p 6379:6379 \
  -v $(pwd)/data:/data \
  one/redis:3.2.9

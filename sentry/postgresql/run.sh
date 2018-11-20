docker run \
  --detach \
  --name sentry-postgres \
  --env POSTGRES_PASSWORD=secret \
  --env POSTGRES_USER=sentry \
  -v $(pwd)/data:/var/lib/postgresql/data \
  postgres:9.5

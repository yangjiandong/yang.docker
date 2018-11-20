docker run \
  --detach \
  --link sentry-redis:redis \
  --link sentry-postgres:postgres \
  --link sentry-smtp:smtp \
  --env SENTRY_SECRET_KEY="#4xlm==we&*5h=o*yty7y1897v-gox391za*2@-95aya#r4_a+" \
  --publish 9000:9000 \
  --name sentry-web \
  sentry-onpremise \
  run web

# run command
# createuser，手工建用户

docker run \
  --rm -it \
  --link sentry-redis:redis \
  --link sentry-postgres:postgres \
  --link sentry-smtp:smtp \
  --env SENTRY_SECRET_KEY="#4xlm==we&*5h=o*yty7y1897v-gox391za*2@-95aya#r4_a+" \
  sentry-onpremise \
  createuser

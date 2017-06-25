FROM alpine:3.4

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'

# for redis-sentinel see: http://redis.io/topics/sentinel
RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		gcc \
		linux-headers \
		make \
		musl-dev \
		tar \
	&& apk del .build-deps



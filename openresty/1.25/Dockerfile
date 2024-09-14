FROM openresty/openresty:1.25.3.2-0-jammy

RUN apt-get update &&\
  apt-get install -y cron \
    imagemagick libmagickwand-dev \
    curl logrotate supervisor procps &&\
  apt-get clean

RUN luarocks install magick

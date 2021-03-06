# Dockerfile - CentOS 7
# https://github.com/openresty/docker-openresty

#FROM centos:7
FROM hub.c.163.com/public/centos:7.0

MAINTAINER yangjiandong <59338947@qq.com>

# Docker Build Arguments
ARG RESTY_VERSION="1.11.2.1"
ARG RESTY_LUAROCKS_VERSION="2.3.0"
ARG RESTY_OPENSSL_VERSION="1.0.2h"
ARG RESTY_PCRE_VERSION="8.38"
ARG RESTY_J="1"
ARG RESTY_CONFIG_OPTIONS="\
    --with-file-aio \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_geoip_module=dynamic \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_image_filter_module=dynamic \
    --with-http_mp4_module \
    --with-http_random_index_module \
    --with-http_realip_module \
    --with-http_secure_link_module \
    --with-http_slice_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_sub_module \
    --with-http_v2_module \
    --with-http_xslt_module=dynamic \
    --with-ipv6 \
    --with-mail \
    --with-mail_ssl_module \
    --with-md5-asm \
    --with-pcre-jit \
    --with-sha1-asm \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    "

# These are not intended to be user-specified
ARG _RESTY_CONFIG_DEPS="--with-openssl=/tmp/openssl-${RESTY_OPENSSL_VERSION} --with-pcre=/tmp/pcre-${RESTY_PCRE_VERSION}"


# 1) Install yum dependencies
# 2) Download and untar OpenSSL, PCRE, and OpenResty
# 3) Build OpenResty
# 4) Cleanup

RUN \
    yum install -y \
        gcc \
        gcc-c++ \
        gd-devel \
        GeoIP-devel \
        libxslt-devel \
        make \
        perl \
        perl-ExtUtils-Embed \
        readline-devel \
        unzip \
        zlib-devel \
    && cd /tmp \
    && curl -fSL https://www.openssl.org/source/openssl-${RESTY_OPENSSL_VERSION}.tar.gz -o openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
    && tar xzf openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
    && curl -fSL https://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${RESTY_PCRE_VERSION}.tar.gz -o pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && tar xzf pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && curl -fSL https://openresty.org/download/openresty-${RESTY_VERSION}.tar.gz -o openresty-${RESTY_VERSION}.tar.gz \
    && tar xzf openresty-${RESTY_VERSION}.tar.gz \
    && cd /tmp/openresty-${RESTY_VERSION} \
    && ./configure -j${RESTY_J} ${_RESTY_CONFIG_DEPS} ${RESTY_CONFIG_OPTIONS} \
    && make -j${RESTY_J} \
    && make -j${RESTY_J} install \
    && cd /tmp \
    && rm -rf \
        openssl-${RESTY_OPENSSL_VERSION} \
        openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
        openresty-${RESTY_VERSION}.tar.gz openresty-${RESTY_VERSION} \
        pcre-${RESTY_PCRE_VERSION}.tar.gz pcre-${RESTY_PCRE_VERSION} \
    && curl -fSL http://luarocks.org/releases/luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz -o luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && tar xzf luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${RESTY_LUAROCKS_VERSION} \
    && ./configure \
        --prefix=/usr/local/openresty/luajit \
        --with-lua=/usr/local/openresty/luajit \
        --lua-suffix=jit-2.1.0-beta2 \
        --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
    && make build \
    && make install \
    && cd /tmp \
    && rm -rf luarocks-${RESTY_LUAROCKS_VERSION} luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && yum clean all \
    && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log

# ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]

# php 5.6
# https://github.com/internavenue/dockerfiles/tree/master/centos-php
# Install Remi Collet's repo for CentOS 7
RUN yum -y install \
  http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
  http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm \
# Install PHP and Percona (MySQL) client stuff and the latest stable PHP.
  && yum -y install --enablerepo=remi,remi-php56 \
  Percona-Server-client-56 \
  php-cli \
  php-fpm \
  php-gd \
  php-mbstring \
  php-mcrypt \
  php-mysqlnd \
  php-opcache \
  php-pdo \
  php-pear \
  php-soap \
  php-xml \
  php-pecl-imagick \
  php-pecl-apcu \
  && yum clean all

#ADD scripts /scripts
#RUN chmod +x /scripts/start.sh
#RUN touch /first_run

#RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php.ini
#ADD etc/fastcgi_params.conf /etc/nginx/conf/fastcgi_params.conf
#RUN mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.default
#ADD etc/www.conf /etc/php-fpm.d/www.conf

## Add Composer
#RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

#ADD scripts /scripts
#RUN chmod +x /scripts/start.sh

## Expose our web root and log directories log.
#VOLUME ["/srv/www", "/var/log", "/var/lib/php", "/run", "/vagrant"]

#EXPOSE 9000 22
## end php

RUN yum -y install curl which tar sudo glibc-common \
  && yum clean all

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN cp /etc/skel/.bashrc /root \
    && cp /etc/skel/.bash_profile /root

# add code
ADD . /app
WORKDIR /app

#CMD ["/app/docker_start_nginx.sh"]


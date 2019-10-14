FROM one/centos:7

MAINTAINER one

ENV PERCONA_TOOLKIT_VERSION 3.1.1

RUN yum install -y \
  perl-DBI \
  perl-DBD-MySQL \
  perl-Time-HiRes \
  perl-IO-Socket-SSL \
  perl-Digest \
  perl-Digest-MD5 \
  perl-TermReadKey

# percona
RUN yum install -y https://repo.percona.com/yum/percona-release-latest.noarch.rpm
RUN yum install -y percona-toolkit \
  Percona-Server-client-55

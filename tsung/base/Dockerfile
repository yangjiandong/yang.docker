
FROM one/centos:7.6

RUN yum install -y \
  erlang \
  perl \
  perl-RRD-Simple.noarch \
  perl-Log-Log4perl-RRDs.noarch \
# Tsung report
  perl-Template-Toolkit \
  gnuplot \
  gd \
  libpng \
  zlib

# SSH install
RUN yum install -y \
    openssh \
    openssh-server \
    openssh-clients

RUN yum install -y python-matplotlib

ADD tsung-1.7.0.tar.gz /tmp/
RUN cd /tmp/tsung-1.7.0 && \
    ./configure --prefix=/usr/local/tsung && \
    make && \
    make install && \
    cd / && rm -Rf /tmp/tsung-1.7.0 && \
    /usr/local/tsung/bin/tsung -v && \
    mkdir -p /usr/local/lib/tsung/bin && \
    ln -s /usr/local/tsung/lib/tsung/bin/* /usr/local/lib/tsung/bin

#settiong ssh
RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh

#clean install
RUN rm -Rf /tsung-1.7.0.tar.gz && \
    rm -Rf /tsung-1.7.0 && \
    yum clean all

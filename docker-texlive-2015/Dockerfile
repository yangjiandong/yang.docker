FROM yangjiandong/base:v2

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

ADD https://raw.githubusercontent.com/harshjv/docker-texlive-2015/master/install-tl-ubuntu install-tl-ubuntu
RUN chmod +x install-tl-ubuntu

RUN ./install-tl-ubuntu

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

ENV PATH /opt/texbin:$PATH

VOLUME /var/texlive

WORKDIR /var/texlive

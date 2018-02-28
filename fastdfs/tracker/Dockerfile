#
# FastDFS Tracker Dockerfile
#

# Pull base images.
FROM one/centos:7.2

# Install env
RUN yum -y install wget gcc git make unzip vixie-cron && yum clean all

# Download and install package
RUN cd /tmp && \
    git clone https://github.com/happyfish100/fastdfs.git && \
    git clone https://github.com/happyfish100/libfastcommon.git

RUN cd /tmp && \
    cd libfastcommon && \
    ./make.sh  && \
    ./make.sh install && \
    ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so && \
    ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so && \
    cd ../fastdfs && \
    ./make.sh  && \
    ./make.sh install && \
    mv /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf && \
    sed -i 's:base_path=.*:base_path=/data/tracker:g' /etc/fdfs/tracker.conf && \
    rm -rf /tmp/*

VOLUME ["/data/tracker"]    

EXPOSE 22122

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
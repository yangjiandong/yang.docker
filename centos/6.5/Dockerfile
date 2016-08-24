# 暂时不用，体积过大
FROM tianon/centos:6.5
MAINTAINER yangjiandong

ADD Centos-Source.repo /etc/yum.repos.d/Centos-Source.repo

RUN yum update -y \
    && yum install -y tar bzip2 yum-utils rpm-build \
    && yum-builddep -y pam \
    && yumdownloader --source pam \
    && rpmbuild --rebuild  --define 'WITH_AUDIT 0' --define 'dist +noaudit' pam*.src.rpm \
    && rpm -Uvh --oldpackage ~/rpmbuild/RPMS/*/pam*+noaudit*.rpm \
    && rm -f /*.rpm \
    && rm -rf ~/rpmbuild

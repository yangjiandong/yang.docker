FROM one/tsung-base:1.7.0

# add filedownload script
# ADD https://raw.githubusercontent.com/Dataman-Cloud/OpenDockerFile/master/basefile/scripts/DM_DOCKER_URI_2.7.py /DM_DOCKER_URI.py
# ADD https://raw.githubusercontent.com/Dataman-Cloud/OpenDockerFile/master/basefile/scripts/filedownload.sh /filedownload.sh
ADD ./scripts/DM_DOCKER_URI_2.7.py /DM_DOCKER_URI.py
ADD ./scripts/filedownload.sh /filedownload.sh

COPY ./scripts/entrypoint.sh /

RUN chmod +x /DM_DOCKER_URI.py /entrypoint.sh /filedownload.sh

# for one tsung
COPY ./config/tsung/id_rsa /root/.ssh/id_rsa
COPY ./config/tsung/authorized_keys /root/.ssh/authorized_keys
COPY ./config/tsung/sshd_config /etc/ssh/sshd_config

WORKDIR workspace
# ENTRYPOINT ["/entrypoint.sh"]

docker run \
    --hostname=quickstart.cloudera \
    --privileged=true \
    -t -i \
    -p 8888:8888 \
    -p 80:80 \
    -p 7180:7180 \
    cloudera/quickstart:0810 /usr/bin/docker-quickstart

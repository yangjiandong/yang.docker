docker run -d \
    -v $(pwd)/cadvisor:/rootfs \
    -v $(pwd)/cadvisor/var/run:/var/run \
    -v $(pwd)/cadvisor/sys:/sys \
    -v $(pwd)/cadvisor/var/lib/docker:/var/lib/docker \
    --link=influxdb:influxdb \
    --name cadvisor \
    google/cadvisor \
    --storage_driver=influxdb \
    --storage_driver_host=influxdb:8086 \
    --storage_driver_db=app \
    --storage_driver_user=root \
    --storage_driver_password=123
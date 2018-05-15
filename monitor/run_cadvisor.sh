docker run -d \
    -v /:/rootfs:ro \
    -v /var/run:/var/run:rw \
    -v /sys:/sys:ro \
    -v /var/lib/docker:/var/lib/docker:ro \
    - p 8081:8080
    --link=influxdb:influxdb \
    --name cadvisor \
    google/cadvisor \
    --storage_driver=influxdb \
    --storage_driver_host=influxdb:8086 \
    --storage_driver_db=app \
    --storage_driver_user=root \
    --storage_driver_password=123
# --privileged=true
# chrom -R 777 grafana

docker run -d \
  -p 3001:3000 \
  -e INFLUXDB_HOST=localhost \
  -e INFLUXDB_PORT=8086 \
  -e INFLUXDB_NAME=cadvisor \
  -e INFLUXDB_USER=cadvisor \
  -e INFLUXDB_PASS=cadvisor \
  -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource" \
  --link=influxdb:influxdb \
  -v "$(pwd)/grafana":/var/lib/grafana \
  --name grafana \
  grafana/grafana

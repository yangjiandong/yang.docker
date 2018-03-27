docker run --name grafana \
    --rm \
    -p 3001:3000 \
    -v "$(pwd)/grafana":/var/lib/grafana \
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource" \
    grafana/grafana
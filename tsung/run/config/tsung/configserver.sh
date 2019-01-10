#!/bin/bash
. ./config.cfg
TOKEN=`./get_token.sh`

if [ -z "$BASE_DIR" ];then
    echo "BASE_DIR is empty!!!" && exit 1
fi

curl -X POST $SRY_BASE_URL/api/v3/clusters/$SRY_CLUSTERID/apps \
    -H Authorization:$TOKEN \
    -H Content-Type:application/json -d '{
       "name": "configserver",
       "cpus": 0.1,
       "mem": 512,
       "instances": 1,
       "volumes": [
        {
            "hostPath": "'${BASE_DIR}'/conf.d",
            "containerPath": "/etc/nginx/conf.d"
        },
        {
            "hostPath": "'${BASE_DIR}'/config",
            "containerPath": "/data/config"
        }
      ],
       "imageName": "'$NGINX_IMAGE_URI'",
       "imageVersion": "'$NGINX_IMAGE_VERSION'",
       "forceImage": false,
       "constraints": [["ip", "LIKE", "'$CONFIGSERVER_IP'" ], ["ip", "UNIQUE"]],
       "network": "HOST",
       "envs":[],
       "portMappings":[],
       "logPaths": []
    }'

#!/bin/bash
. ./config.cfg
TOKEN=`./get_token.sh` <- 获取token

curl -X POST $SRY_BASE_URL/api/v3/clusters/$SRY_CLUSTERID/apps \
    -H Authorization:$TOKEN \
    -H Content-Type:application/json -d '{
       "name": "nginx_test",
       "cpus": 1,
       "mem": 1024,
       "instances": 1,
       "volumes": [],
       "imageName": "'$NGINX_TEST_IMAGE_URI'",
       "imageVersion": "'$NGINX_TEST_IMAGE_VERSION'",
       "forceImage": false,
       "constraints": [["ip", "LIKE", "'$NGINX_TEST_SERVER_IP'" ], ["ip", "UNIQUE"]],
       "network": "HOST",
       "envs": [
        {
            "key": "COUNTER_BATCH",
            "value": "5"
        },
        {
            "key": "PROXY_MODE",
            "value": "dev"
        },
        {
            "key": "TOKEN_COOKIE",
            "value": "DM_SK_UID"
        },
        {
            "key": "SALT_OFFSET",
            "value": "180000"
        }
            ],
      "portMappings":[],
      "logPaths": []
    }'

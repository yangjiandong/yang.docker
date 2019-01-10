#!/bin/bash
# shurenyun get token
. ./config.cfg

TOKEN=`cat /tmp/sry-api-token 2>/dev/null`
CODE=`curl -X GET --header "Accept: application/json" --header "Authorization: $TOKEN"  "$SRY_BASE_URL/api/v3/auth" 2>/dev/null |python -m json.tool| awk -F ':|"|,|' '/code/{print $4}'`

if [ -z "$CODE" ] || [ "$CODE" -ne 0 ];then
    TOKEN=`curl -X POST --header "Content-Type: application/json" --header "Accept: application/json" -d "{
            \"email\":\"${SRY_USER}\",
            \"password\":\"${SRY_PASSWD}\"
    }" "$SRY_BASE_URL/api/v3/auth" 2>/dev/null |python -m json.tool|awk -F ':|"' '/token/{print $5}' `
    echo "$TOKEN" > /tmp/sry-api-token
fi
echo $TOKEN

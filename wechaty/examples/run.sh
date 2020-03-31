    # -e WECHATY_LOG="$WECHATY_LOG" \
    # -e WECHATY_PUPPET="$WECHATY_PUPPET" \
    # -e WECHATY_TOKEN="$WECHATY_TOKEN" \
    # -e WECHATY_PUPPET_PADPLUS_TOKEN
    # puppet: wechaty-puppet-mock
docker run \
    -t -i --rm \
    -e WECHATY_PUPPET=wechaty-puppet-padplus \
    --mount type=bind,source="$(pwd)",target=/bot \
    zixia/wechaty:latest \
    "$@"

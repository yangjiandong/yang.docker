#!/bin/bash

if [ "${REDIS_ENV_PASS}" == "**Random**" ]; then
    unset REDIS_ENV_PASS
fi

# Set initial configuration
if [ ! -f /.redis_configured ]; then
    mkdir -p /etc/redis
    touch /etc/redis/redis_default.conf

    if [ "${REDIS_ENV_PASS}" != "**None**" ]; then
        PASS=${REDIS_ENV_PASS:-$(pwgen -s 32 1)}
        _word=$( [ ${REDIS_ENV_PASS} ] && echo "preset" || echo "random" )
        echo "=> Securing redis with a ${_word} password"
        echo "requirepass $PASS" >> /etc/redis/redis_default.conf
        echo "=> Done!"
        echo "========================================================================"
        echo "You can now connect to this Redis server using:"
        echo ""
        echo "    redis-cli -a $PASS -h <host> -p <port>"
        echo ""
        echo "Please remember to change the above password as soon as possible!"
        echo "========================================================================"
    fi

    unset REDIS_ENV_PASS

    # Backwards compatibility
    if [ ! -z "${REDIS_ENV_MODE}" ]; then
        echo "!! WARNING: \$REDIS_ENV_MODE is deprecated. Please use \$REDIS_ENV_MAXMEMORY_POLICY instead"
        if [ "${REDIS_ENV_MODE}" == "LRU" ]; then
            export REDIS_ENV_MAXMEMORY_POLICY=allkeys-lru
            unset REDIS_ENV_MODE
        fi
    fi

    for i in $(printenv | grep REDIS_ENV_ | grep -v  'REDIS_DOWNLOAD_URL\|REDIS_DOWNLOAD_SHA1\|REDIS_VERSION'); do
        echo $i | sed "s/REDIS_ENV_//" | sed "s/_/-/" | sed "s/=/ /" | sed "s/^[^ ]*/\L&\E/" >> /etc/redis/redis_default.conf
    done

    echo "=> Using redis.conf:"
    cat /etc/redis/redis_default.conf | grep -v "requirepass"

    touch /.redis_configured
fi

exec redis-server  /etc/redis/redis_default.conf

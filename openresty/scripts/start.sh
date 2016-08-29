#!/bin/bash
# Starts up PHP-FPM within the container.

# Stop on error
set -e

SESSION_DIR=/var/lib/php/session
LOG_DIR=/var/log/php-fpm
WSDL_CACHE_DIR=/var/lib/php/wsdlcache
LOCK_DIR=/var/run/lock/subsys

# The main user for PHP-FPM.
PHP_USER=apache
PHP_GROUP=apache

if [[ -e /first_run ]]; then
  source /scripts/first_run.sh
else
  source /scripts/normal_run.sh
fi

pre_start_action
post_start_action

chown -R $PHP_USER:$PHP_GROUP $SESSION_DIR
chown -R $PHP_USER:$PHP_GROUP $WSDL_CACHE_DIR
chown -R $PHP_USER:$PHP_GROUP $LOG_DIR
chown -R $PHP_USER:$PHP_GROUP $LOCK_DIR

echo "Starting Syslog-ng..."
syslog-ng --no-caps

echo "Starting SSHd..."
/usr/sbin/sshd

echo "Starting PHP-FPM..."
/etc/init.d/php-fpm start


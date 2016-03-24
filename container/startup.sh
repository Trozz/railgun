#!/bin/env bash

[ -z "$TOKEN" ] && { echo "Need to set TOKEN"; exit 1; }
[ -z "$HOST" ] && { echo "Need to set HOST"; exit 1; }
echo "Updating Config file"
sed -i -e "s/YOUR_TOKEN_HERE/${TOKEN}/" -e "s/YOUR_PUBLIC_IP_OR_HOSTNAME/${HOST}/" -e "s/127.0.0.1:11211/${MEMCACHED_SERVER:-memcache}:${MEMCACHED_PORT:-11211}/" -e "s/log.level = 0/log.level = ${LOG_LEVEL:-0}/" /etc/railgun/railgun.conf
echo "Create log file if not present"
[ ! -f /var/log/railgun/panic.log ] && { touch /var/log/railgun/panic.log; }
echo "Starting Railgun"
RAILGUN_PATH=$(/usr/bin/which rg-listener)
$RAILGUN_PATH -config "/etc/railgun/railgun.conf"

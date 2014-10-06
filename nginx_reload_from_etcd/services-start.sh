#!/usr/bin/env bash
set -o errexit
sentinel -config=/etc/sentinel/config.yml -exec=upstream
cat /etc/nginx/conf.d/default.conf
sentinel -config=/etc/sentinel/config.yml &
nginx -g "daemon off;"

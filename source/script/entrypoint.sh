#!/usr/bin/env bash

set -euo pipefail
command="${1}"

if [ "${command}" = 'nginx-php-fpm' ]; then
    echo 'Starting supervisor for nginx and php-fpm.'
    supervisord --configuration '/etc/supervisor/supervisord.conf' --user 'root' --nodaemon
fi

exec "${@}"
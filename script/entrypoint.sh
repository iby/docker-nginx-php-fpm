#!/usr/bin/env bash

cd $(dirname $0)

# If we have the `configure.sh` script execute it to configure the container prior starting it.

if [ -f 'configure.sh' ]; then
    echo 'Found the configuration script, running it now.'
    ./configure.sh
fi

# Start the supervisor if the command is `nginx-php-fpm`.

if [ "$1" = 'nginx-php-fpm' ]; then

    # Override the default nginx configuration if the custom one is provided.

    if [ -f '../configuration/nginx.conf' ]; then
        cp '../configuration/nginx.conf' '/etc/nginx/nginx.conf'
    fi

    supervisord --nodaemon --configuration="../configuration/supervisord.conf"
fi
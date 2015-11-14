#!/usr/bin/env bash

cd $(dirname $0)

# Install apk packages and remove apk cache when finished.

echo -n 'Updating and installing dependencies…'

apt-get update > /dev/null
apt-get install --no-install-recommends --target-release 'sid' --yes \
    ca-certificates \
    imagemagick \
    nginx \
    php5-curl \
    php5-fpm \
    php5-imagick \
    php5-mcrypt \
    php5-mongo \
    php5-pgsql \
    supervisor > /dev/null

echo ' OK!'

# Setup entrypoint, setup default configurations, make sure default log directories exist.

echo -n 'Setting up image…'

mv './entrypoint.sh' '/'
cp -ar '../configuration/nginx/nginx.conf' '/etc/nginx/nginx.conf'
cp -ar '../configuration/php/php-fpm.conf' '/etc/php5/fpm/php-fpm.conf'
cp -ar '../configuration/php/php.ini' '/etc/php5/cli/php.ini'
cp -ar '../configuration/php/php.ini' '/etc/php5/fpm/php.ini'
cp -ar '../configuration/supervisor/'* '/etc/supervisor/conf.d'

[ -d '/var/log/nginx' ] || mkdir --parents '/var/log/nginx'
[ -d '/var/log/php' ] || mkdir --parents '/var/log/php'

echo ' OK!'

# Clean up.

echo -n 'Cleaning up image…'
rm -rf \
    '/docker' \
    '/tmp/'* \
    '/var/cache/'* \
    '/var/lib/apt/lists/'* \
    '/var/tmp/'*
echo ' OK!'
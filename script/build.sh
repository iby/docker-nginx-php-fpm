#!/usr/bin/env bash

cd $(dirname $0)

# Install apk packages and remove apk cache when finished.

apt-get update
apt-get install --no-install-recommends --yes -t sid \
    imagemagick \
    nginx \
    php5-curl \
    php5-fpm \
    php5-imagick \
    php5-mcrypt \
    php5-mongo \
    php5-pgsql \
    supervisor

rm -rf \
    /tmp/* \
    /var/cache/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /var/www/*

# Update php configuration.

sed -i \
    -e 's/group =.*/group = www-data/' \
    -e 's/user =.*/user = www-data/' \
    -e 's/listen\.owner.*/listen.owner = www-data/' \
    -e 's/listen\.group.*/listen.group = www-data/' \
    -e 's/listen = .*$/listen = 127.0.0.1:9000/' \
    /etc/php5/fpm/pool.d/www.conf

sed -i \
    -e '/open_basedir =/s/^/\;/' \
    /etc/php5/fpm/php.ini
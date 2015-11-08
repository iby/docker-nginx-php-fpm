#!/usr/bin/env bash

set -euo pipefail

# Bring up etcd service container and wait a little until etcd gets initialised.

docker run \
    --detach \
    --name 'nginx-php-fpm' \
    --publish '80:80' \
    --volume "$(pwd)/test/www:/var/www" \
    nginx-php-fpm

sleep 5

echo -n 'Verify info.php request not failing.'
curl --fail --location --request 'GET' --silent http://localhost/info.php > /dev/null
echo ' OK!'
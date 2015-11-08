#!/usr/bin/env bash

set -euo pipefail

# Authenticate with docker and push the latest image.

echo -n 'Pushing image to docker hub…'

docker login --email "${DOCKER_HUB_EMAIL}" --password "${DOCKER_HUB_PASSWORD}" --username "${DOCKER_HUB_USER}" > /dev/null
docker tag 'nginx-php-fpm' 'ianbytchek/nginx-php-fpm:debian-sid' > /dev/null
docker push 'ianbytchek/nginx-php-fpm:debian-sid' > /dev/null
docker logout

echo ' OK!'


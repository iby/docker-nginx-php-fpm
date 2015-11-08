#!/usr/bin/env bash

# Build docker image.

set -euo pipefail
docker build --tag 'nginx-php-fpm' './source'
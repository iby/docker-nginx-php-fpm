# Docker: nginx + php-fpm

[![Circle CI](https://circleci.com/gh/ianbytchek/docker-nginx-php-fpm.svg?style=svg)](https://circleci.com/gh/ianbytchek/docker-nginx-php-fpm)

Docker Nginx & PHP-FPM image built on Alpine Linux micro OS with the final image size of 58 MB vs. 100+ MB compared to the Ubuntu / Debian equivalent. It's intended to be used as a base image for building final app images ready for deployment, but can be used as is and configured via volumes.

# Running

Pull or build the image yourself and run it. Before you do that you'll need to configure Nginx and have the application ready for "dockerisation". Both can be passed using mounted volumes or baked right into the image during the build.

```
# Build
docker build -t ianbytchek/nginx-php-fpm .

# Or pull
docker pull ianbytchek/nginx-php-fpm

# Run
docker run -d -p 80:80 -p 443:443 --name app ianbytchek/nginx-php-fpm

# Run with a mounted volume
docker run -d -p 80:80 -p 443:443 -v $PATH:/docker/configuration --name app ianbytchek/nginx-php-fpm
```

## Bonus

```
# Connect to an existing container.
docker exec -ti haproxy sh
 
# Remove exited containers.
docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm
 
# Remove intermediary and unused images.
docker rmi $(docker images -aq -f "dangling=true")
```
FROM debian:sid
MAINTAINER Ian Bytchek

COPY . /docker
RUN /docker/script/build.sh
EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx-php-fpm"]
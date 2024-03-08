FROM debian:bullseye

RUN apt-get update -y ; apt-get upgrade -y \
    ; apt-get install php7.4-fpm -y \
    ; apt-get install php-mysql -y \
    ; apt-get install curl -y \
    ; curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    ; chmod +x wp-cli.phar \
    ; mv wp-cli.phar /bin/wp && cp /usr/sbin/php-fpm7.4 /bin/pfpm

COPY ./tools/init.sh /

RUN service php7.4-fpm start && chmod +x /init.sh

CMD ["/init.sh"]
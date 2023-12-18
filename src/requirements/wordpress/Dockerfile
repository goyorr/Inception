FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install php7.4-fpm php-mysql -y \
    && apt-get install wget -y \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/start.sh /

RUN service php7.4-fpm start

RUN chmod +x /start.sh

CMD ["/start.sh"]
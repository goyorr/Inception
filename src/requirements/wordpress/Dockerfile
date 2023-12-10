FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install php7.4-fpm php-mysql -y \
    && apt install wget -y \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /

RUN service php7.4-fpm start

RUN chmod +x /script.sh

CMD ["/script.sh"]
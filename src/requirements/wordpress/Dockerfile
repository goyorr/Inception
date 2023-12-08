FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install php7.4-fpm php-mysql -y \
    && apt install wget -y \
    && service start php7.4-fpm
    # && service enable php7.4-fpm \ 
    # && wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    # && tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html \
    # && chown -R www-data.www-data /var/www/html/wordpress \
    # && chmod -R 755 /var/www/html/wordpress

COPY ./files/script.sh /

RUN service php7.4-fpm start

RUN chmod +x /script.sh

CMD ["/script.sh"]
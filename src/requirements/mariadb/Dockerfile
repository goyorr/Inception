FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install mariadb-server -y

COPY ./tools/start.sh /

RUN chmod +x /start.sh

CMD ["/start.sh"]
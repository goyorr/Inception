FROM debian:bullseye

RUN apt-get update -y ; apt-get upgrade -y \
    ; apt-get install mariadb-server -y \ 
    ; apt-get install mariadb-client

COPY ./tools/init.sh /

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /init.sh

CMD ["/init.sh"]
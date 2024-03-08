FROM debian:bullseye

RUN apt-get update -y \
    ; apt-get upgrade -y \
    ; apt-get install nginx -y \
    ; apt-get install openssl -y \
    ; mkdir -p /etc/nginx/certs \
    ; openssl req -x509 -newkey rsa:4096 -days 20 -nodes -keyout /etc/nginx/certs/new.key \
    -out /etc/nginx/certs/new.crt -subj "/C=Cc/L=Lc/O=Oc/OU=OUc/CN=zel-kach"

COPY ./default.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
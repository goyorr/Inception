FROM ubuntu:bullseye

RUN apt-get update && apt-get install nginx openssl -y && mkdir -p /etc/nginx/certs

RUN openssl req -x509 -nodes -days 25 -newkey rsa:4096 -keyout \
    /etc/nginx/certs/lmao.key -out /etc/nginx/certs/lmao.crt \
    -subj "/C=HE/L=lmao/O=lol.co/OU=lol/CN=zel-kach.42.fr"

COPY ./default.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off"]
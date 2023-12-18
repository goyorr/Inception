FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install nginx openssl -y \
    && mkdir -p /etc/nginx/cert \
    && openssl req -x509 -nodes -days 25 -newkey rsa:4096 \
    -keyout /etc/nginx/cert/lmao.key -out /etc/nginx/cert/lmao.crt \
    -subj "/C=HE/L=lmao/O=lol.co/OU=lol/CN=zel-kach.42.fr" 

COPY ./tools/default.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]

 
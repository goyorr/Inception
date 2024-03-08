#!/bin/bash

mkdir -p /wp
rm -rf /wp/*

echo -e "\nlisten = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf
date > /wp/wordpress.date
# wordpress    | If you'd like to continue as root, please run this again, adding this flag:  --allow-root
wp core download --allow-root --path=/wp
cp  /wp/wp-config-sample.php /wp/wp-config.php

wp config set DB_NAME mariadb --allow-root --path=/wp
wp config set DB_USER $DB_USR --allow-root --path=/wp
wp config set DB_HOST mariadb --allow-root --path=/wp
wp config set DB_PASSWORD $DB_PASSWD --allow-root --path=/wp

wp core install --url="$URL" --title="title" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/wp

pfpm -F
#!/bin/sh

mkdir -p /var/www/html

cd /var/www/html

wp core download --allow-root --version=5.8.1 --locale=en_US

wp config create --allow-root --dbname=${WP_NAME} --dbuser=${WP_ADMIN_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST}

wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_PASSWORD}" --role=author

exec php-fpm7 -F -R 
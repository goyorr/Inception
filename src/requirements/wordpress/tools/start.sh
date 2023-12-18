#!/bin/sh

mkdir -p /wp-isntall

chmod -R 777 /wp-install;

cd /wp-install

wp core download --allow-root

mv /wp-install/wp-config-sample.php /wp-install/wp-config.php

wp config set DB_NAME $DB_NAME --allow-root
wp config set DB_USER $DB_USER --allow-root
wp config set DB_HOST mariadb --allow-root
wp config set DB_PASSWORD $DB_ROOT_PASSWD --allow-root

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_EMAIL_USER --role=author --user_pass=$WP_USER_PASSWD --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

chown -R www-data:www-data /wp

/usr/sbin/php-fpm7.4 -F
#!/bin/bash

#https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password
#When logging into MariaDB for the first time, a root password must be set. Resetting it can be necessary for a number of reasons.

date > /var/lib/mysql/mariadb.date

# mysqld_safe 
# sleep 10
service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS mariadb;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$DB_USR'@'%' IDENTIFIED BY '$DB_PASSWD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON mariadb.* to '$DB_USR'@'%';"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$DB_USR2'@'%' IDENTIFIED BY '$DB_PASSWD2';"
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWD';"

mariadb-admin --user=root -p$DB_PASSWD shutdown

mysqld_safe
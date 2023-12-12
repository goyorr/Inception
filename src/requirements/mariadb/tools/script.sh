#!/bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mysql -u root -p$DB_ROOT_PASSWD < ./tools/cmd.sql

kill    $(cat /var/run/mysqld/mysqld.pid)

#Safe Mode:
#In safe mode, mysqld_safe takes care of some tasks, such as automatically restarting the server in case it crashes.
#Automatic Restart:
#If the MySQL or MariaDB server process terminates unexpectedly, mysqld_safe will attempt to restart it.
mysqld_safe
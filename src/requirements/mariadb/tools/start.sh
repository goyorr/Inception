#!/bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo    "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root

echo    "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';" | mysql -u root

echo    "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' " | mysql -u root

echo    "FLUSH PRIVILEGES;" | mysql -u root

echo     "SET PASSWORD FOR 'root'@localhost = PASSWORD('$DB_ROOT_PASSWD');" | mysql -u root

# echo    "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWD';" | mysql -u root

mysqladmin -u root -p"$DB_ROOT_PASSWD" shutdown

mysqld_safe --skip-grant-tables




# #!/bin/bash

# sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# service mariadb start

# mysql -u root -p$DB_ROOT_PASSWD < ./tools/cmd.sql

# mysqladmin -u root --password=$DB_ROOT_PASSWD shutdown

# #Safe Mode:
# #In safe mode, mysqld_safe takes care of some tasks, such as automatically restarting the server in case it crashes.
# #Automatic Restart:
# #If the MySQL or MariaDB server process terminates unexpectedly, mysqld_safe will attempt to restart it.
# mysqld_safe
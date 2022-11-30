#!/bin/bash
# -- DELETE FROM mysql.user WHERE User='';
# -- DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# -- DROP DATABASE IF EXISTS test;
# -- DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

echo "CREATE DATABASE IF NOT EXISTS yourdb;" | mysql -u root

echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON yourdb.* TO '$MYSQL_USER'@'%';" | mysql -u root

echo "USE yourdb;" | mysql -u root

echo "UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='root';" | mysql -u root
echo "UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# -- change root password
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root


# --  To verify the right permissions you just granted to the user, run this command:
# --    SHOW GRANTS FOR 'hliwa'@localhost;

# -- UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root';

echo "FLUSH PRIVILEGES;" | mysql -u root -p$MYSQL_ROOT_PASSWORD
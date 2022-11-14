#!/bin/sh

echo "1- change configuration"
cd /etc/mysql/mariadb.conf.d

sed -i 's/^#port                   = 3306/port = 3306/' 50-server.cnf

echo "----------configuration done-----------" 


echo "2- creat sqluser"

echo "CREATE DATABASE yourdb;" |  mariadb -u root
echo "CREATE USER 'hliwa'@'localhost' IDENTIFIED BY 'secret';" | mariadb -u root 
echo "GRANT ALL PRIVILEGES ON yourdb.* TO 'hliwa'@localhost;" | mariadb -u root
# To verify the right permissions you just granted to the user, run this command:
# echo "SHOW GRANTS FOR 'hliwa'@localhost;" | mariadb -u root -e
echo "FLUSH PRIVILEGES;" | mariadb -u root

echo "----------configuration done-----------"

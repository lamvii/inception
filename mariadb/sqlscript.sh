#!/bin/sh
/etc/init.d/mariadb setup
rc-service mariadb start
# rc-service mariadb stop

echo "1- change configuration"
cd /etc/my.cnf.d/

sed -i  's/skip-networking/#skip-networking/' mariadb-server.cnf
sed -i  's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' mariadb-server.cnf
sed -i	'11i port=3306' mariadb-server.cnf
sed -i	'12i socket=/run/mysqld' mariadb-server.cnf

echo "----------configuration done-----------" 


echo "2- creat sqluser"

echo "CREATE DATABASE yourdb;" |  mariadb -u root
echo "CREATE USER 'hliwa'@'localhost' IDENTIFIED BY 'secret';" | mariadb -u root 
echo "GRANT ALL PRIVILEGES ON yourdb.* TO 'hliwa'@localhost;" | mariadb -u root
# To verify the right permissions you just granted to the user, run this command:
# echo "SHOW GRANTS FOR 'hliwa'@localhost;" | mariadb -u root -e
echo "FLUSH PRIVILEGES;" | mariadb -u root

echo "----------configuration done-----------"
mysqld_safe
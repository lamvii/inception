#!/bin/sh

echo "1- change configuration"
cd /etc/mysql/mariadb.conf.d

sed -i 's/#port/port/' 50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/g' 50-server.cnf

echo "----------configuration done-----------" 


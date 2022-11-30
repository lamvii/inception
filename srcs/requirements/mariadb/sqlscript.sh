#!/bin/sh

echo "1- change configuration"

sed -i 's/#port                   = 3306/port = 3306/' 50-server.cnf
sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' 50-server.cnf

echo "----------configuration done-----------" 


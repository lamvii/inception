#!/bin/bash

mkdir -p /run/php/

tar -xvzf latest.tar.gz
mv wordpress/* ./
rm -f latest.tar.gz index.html
cp wp-config-sample.php wp-config.php

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', 'yourdb' );/"               wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/"               wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/"   wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/"                       wp-config.php

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/;listen = \/run\/php\/php7.3-fpm.sock/'               /etc/php/7.3/fpm/pool.d/www.conf
sed -i '37i listen = 0.0.0.0:9000'                                                                  /etc/php/7.3/fpm/pool.d/www.conf

#!/bin/bash

mkdir -p /run/php/

# tar -xvzf latest.tar.gz
# mv wordpress/* ./
# rm -f latest.tar.gz index.html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp --allow-root core download
cp wp-config-sample.php wp-config.php

# echo $MYSQL_USER-------------------
# echo $MYSQL_PASSWORD--------------------

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', 'yourdb' );/"               wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/"               wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/"   wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/"                       wp-config.php

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/;listen = \/run\/php\/php7.3-fpm.sock/'               /etc/php/7.3/fpm/pool.d/www.conf
sed -i '37i listen = 0.0.0.0:9000'                                                                  /etc/php/7.3/fpm/pool.d/www.conf

wp core --allow-root install --url="localhost" --title="inception" --admin_user=$MYSQL_USER \
        --admin_password=$MYSQL_PASSWORD --admin_email="ael-idri@email.com"

/usr/sbin/php-fpm7.3 -F
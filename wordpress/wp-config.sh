#!/bin/bash

mkdir -p /run/php/

cp wp-config-sample.php wp-config.php

chown -R www-data:www-data /var/www/html

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/;listen = \/run\/php\/php7.3-fpm.sock/'               /etc/php/7.3/fpm/pool.d/www.conf
sed -i '37i listen = 0.0.0.0:9000'                                                                  /etc/php/7.3/fpm/pool.d/www.conf

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', 'yourdb' );/"               wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/"               wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/"   wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/"                       wp-config.php

#service php7.3-fpm start
wp core --allow-root install --url="localhost" --title="inception" --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASSWORD --admin_email="ael-idri@email.com" 

wp --allow-root theme activate twentytwentyone

wp --allow-root plugin install redis-cache --activate
wp config --allow-root set WP_REDIS_PORT 6379
wp config --allow-root set WP_REDIS_HOST redis

wp --allow-root redis enable

php-fpm7.3 -F
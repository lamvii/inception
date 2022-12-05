#!/bin/bash

/bin/mkdir $_CERTIF

openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout $_CERTIF_key -out $_CERTIF_crt \
	-subj "/C=MA/ST=St/L=Lo/O=in/OU=or/CN=Co"


		###SSL:
sed -i "s/listen 80 default_server;/listen 443 ssl;/" 															/etc/nginx/sites-enabled/default
sed -i "s/listen \[::\]:80 default_server;/listen \[::\]:443 ssl;/" 												/etc/nginx/sites-enabled/default

sed -i "24i		ssl_certificate $_CERTIF_crt;" 																					/etc/nginx/sites-enabled/default
sed -i "25i		ssl_certificate_key $_CERTIF_key;" 																				/etc/nginx/sites-enabled/default
sed -i '27i		# TLS 1.3 only'																					/etc/nginx/sites-enabled/default
sed -i '28i		ssl_protocols TLSv1.3;' 																						/etc/nginx/sites-enabled/default


		###wordpress:
sed -i "s/index index.html index.htm index.nginx-debian.html;/index index.php;/"	/etc/nginx/sites-enabled/default
sed -i "s/server_name _;/server_name ael-idri.42.fr;/"								/etc/nginx/sites-enabled/default
sed -i "57i location ~ \.php$ {"													/etc/nginx/sites-enabled/default
sed -i "58i      include snippets/fastcgi-php.conf;" /etc/nginx/sites-enabled/default
sed -i "59i fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;"							/etc/nginx/sites-enabled/default
sed -i "60i       fastcgi_pass wordpress:9000;"																			/etc/nginx/sites-enabled/default
sed -i '61i		}'																							/etc/nginx/sites-enabled/default


# nginx -t

# service nginx reload
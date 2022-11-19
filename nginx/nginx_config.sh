#!/bin/bash

/bin/mkdir $_CERTIF

openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout $_CERTIF_key -out $_CERTIF_crt \
	-subj "/C=MA/ST=St/L=Lo/O=in/OU=or/CN=Co"


sed -i "24i		ssl_certificate $_CERTIF_crt;" /etc/nginx/sites-enabled/default
sed -i "25i		ssl_certificate_key $_CERTIF_key;" /etc/nginx/sites-enabled/default

sed -i "26i #newline :)" /etc/nginx/sites-enabled/default

sed -i '27i		# TLS 1.3 only' /etc/nginx/sites-enabled/default
sed -i '28i		ssl_protocols TLSv1.3;' /etc/nginx/sites-enabled/default
sed -i "30i #newline :)" /etc/nginx/sites-enabled/default;

sed -i "s/listen 80 default_server;/listen 443 ssl http2;/" /etc/nginx/sites-enabled/default
sed -i "s/listen \[::\]:80 default_server;/listen \[::\]:443 ssl http2;/" /etc/nginx/sites-enabled/default

nginx -t

service nginx reload
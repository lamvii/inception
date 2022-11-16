# !/bin/sh


service nginx start
mkdir /etc/nginx/ssl
openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt \
	-subj "/C=Morooco/ST=StateProvince/L=Local/O=inception/OU=organization/CN=CommonName"


cd etc/nginx/sites-enabled/

sed -i '24i		ssl_certificate /etc/nginx/ssl/selfsigned.crt;' default
sed -i '25i		ssl_certificate_key /etc/nginx/ssl/selfsigned.key;' default


sed -i '26i' default.conf

sed -i '27i		# TLS 1.3 only' default
sed -i '28i		ssl_protocols TLSv1.3;' default
sed -i '29i		ssl_prefer_server_ciphers off;' default
sed -i '30i' default

sed -i 's/listen 80 default_server;/listen 443 ssl http2;/' default
sed -i 's/listen \[::\]:80 default_server;/listen \[::\]:443 ssl http2;/' default


# Make sure the nginx starts when system reboots:
# rc-update add nginx default

nginx -t
service nginx restart
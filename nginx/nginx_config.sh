# !/bin/sh


service nginx start
mkdir /etc/nginx/ssl
openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt \
	-subj "/C=Ma/ST=khouribga/L=aa/O=aa/OU=aa/CN=aa"


cd etc/nginx/conf.d/

# sed -i '7i		ssl_certificate /etc/nginx/ssl/selfsigned.crt;' default.conf
# sed -i '8i		ssl_certificate_key /etc/nginx/ssl/selfsigned.key;' default.conf
# sed -i '9i		ssl_session_timeout 1d;' default.conf
# sed -i '10i		ssl_session_cache shared:SharedNixCraftSSL:10m; ' default.conf
# sed -i '11i		ssl_session_tickets off;' default.conf
# sed -i '12i' default.conf
# sed -i '13i		# TLS 1.3 only' default.conf
# sed -i '14i		ssl_protocols TLSv1.3;' default.conf
# sed -i '15i		ssl_prefer_server_ciphers off;' default.conf
# sed -i '16i' default.conf

# sed -i  's/listen 80 default_server;/listen 443 ssl http2;/' default.conf
# sed -i 's/listen \[::\]:80 default_server;/listen \[::\]:443 ssl http2;/' default.conf


# Make sure the nginx starts when system reboots:
# rc-update add nginx default

nginx -t
service nginx restart
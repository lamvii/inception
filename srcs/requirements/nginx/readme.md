# nginx

- how to config nginx with tls1.2 | tls1.3: \
	[configure-nginx-to-use-only-tls](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
- to get certificate and learn more about openssl \
	1 - important : \
	[openssl-quick-reference-guide](https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm#:~:text=OpenSSL%20is%20an%20open%2Dsource,certificate%2C%20and%20identify%20certificate%20information) \
	[ssl-certificates-explained](http://www.steves-internet-guide.com/ssl-certificates-explained/) \
	2 - secondary: \
	[prise-en-main-de-tls](https://connect.ed-diamond.com/GNU-Linux-Magazine/glmf-226/prise-en-main-de-tls-1.3-avec-openssl-1.1.1) 
- Creating Your CSR with One Command
	```
		openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt
	```
	##### new           new request.
	##### newkey rsa:bits generate a new RSA key of 'bits' in size 
	##### x509          output a x509 structure instead of a cert. req.
	##### days          number of days a certificate generated by -x509 is valid for.
	##### keyout arg    file to send the key to
	##### out arg       output file


- in nginx conf file ( /etc/nginx/http.d/default.conf ) add:

```
	server
		{
			listen 443 ssl http2;
    			listen [::]:443 ssl http2;
	
	
			ssl_certificate /etc/nginx/ssl/selfsigned.crt;
			ssl_certificate_key /etc/nginx/ssl/selfsigned.key;
			ssl_session_timeout 1d;
			ssl_session_cache shared:SharedNixCraftSSL:10m; 
			ssl_session_tickets off;
	
			# TLS 1.3 only
			ssl_protocols TLSv1.3;
			ssl_prefer_server_ciphers off;

		}
```

- Test Nginx TLS 1.3 support: 
```
	curl -I -v --tlsv1.3 --tls-max 1.3 https://localhost:443 
```

- resource: \
https://www.nginx.com/resources/wiki/start/topics/examples/full/

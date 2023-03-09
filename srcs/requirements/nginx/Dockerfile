
FROM debian:buster

ARG _CERTIF=$_CERTIF
ARG _CERTIF_key=$_CERTIF_key
ARG _CERTIF_crt=$_CERTIF_crt

RUN apt update; apt install  openssl vim nginx -y;

COPY nginx_config.sh /tmp/

RUN /bin/bash /tmp/nginx_config.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
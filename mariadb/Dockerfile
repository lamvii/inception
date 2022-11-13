FROM alpine:latest
RUN apk update && apk upgrade && apk add mariadb
RUN apk add mariadb-client 
RUN apk add openrc
COPY sqlscript.sh /etc/my.cnf.d/sqlscript.sh
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 3306

ENTRYPOINT [ "/bin/sh", "/etc/my.cnf.d/sqlscript.sh"]


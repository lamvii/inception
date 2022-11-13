FROM alpine:latest
RUN apk update && apk upgrade && apk add mariadb
RUN apk add mysql-client mariadb-common mariadb-server-utils
RUN apk add openrc
# RUN apk add net-tools
COPY sqlscript.sh /etc/my.cnf.d/sqlscript.sh
RUN openrc
RUN touch /run/openrc/softlevel

#  to create (initialized/installed) new database:
RUN /etc/init.d/mariadb setup

RUN rc-service mariadb start

RUN chmod -R 755 /var/run/mysqld

RUN chmod +x /etc/my.cnf.d/sqlscript.sh
RUN ./etc/my.cnf.d/sqlscript.sh


# RUN rc-service mariadb stop
# RUN rc-service mariadb status

#MariaDB will start automatically after a system reboot:
# RUN rc-update add mariadb default



EXPOSE 3306

CMD exec mysqld_safe


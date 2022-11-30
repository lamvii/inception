FROM debian:buster

ARG MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ARG MYSQL_USER=$MYSQL_USER
ARG MYSQL_PASSWORD=$MYSQL_PASSWORD

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install mariadb-server -y

COPY sqlscript.sh  /etc/mysql/
COPY creat_user.sh  /etc/mysql/

WORKDIR /etc/mysql/mariadb.conf.d

RUN /bin/sh /etc/mysql/sqlscript.sh

# RUN service mysql start && mysql -u root < /etc/mysql/creat_user.sql 

RUN service mysql start && /bin/sh /etc/mysql/creat_user.sh

EXPOSE 3306

CMD [ "mysqld_safe" ]


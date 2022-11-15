FROM debian:buster
# RUN  apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN  apt-get update 
RUN apt-get install mariadb-server -y

COPY sqlscript.sh  /etc/mysql/
COPY auto_secure_install.sql  /etc/mysql/

WORKDIR /etc/mysql/mariadb.conf.d

RUN /bin/sh /etc/mysql/sqlscript.sh

RUN service mysql start && mysql -u root < /etc/mysql/auto_secure_install.sql 

expose 3306

CMD [ "mysqld_safe" ]


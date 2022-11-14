FROM debian:buster
# RUN  apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN  apt-get update 
RUN apt-get install mariadb-server -y

COPY sqlscript.sh  /etc/mysql/

COPY auto_secure_install.sql  /etc/mysql/
RUN service mysql start && mysql -sfu root < /etc/mysql/auto_secure_install.sql \
    && /bin/sh /etc/mysql/sqlscript.sh

CMD [ "mysqld" ]


this is how you can install mariadb on debian:buster:
	https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10
to automate mysql_secure_installation Script:
	https://fedingo.com/how-to-automate-mysql_secure_installation-script/




connect mariadb with adminer: add in your docker-compose :
  adminer:
    # build: ./adminer/
    image: adminer
    container_name: adminer
    ports:
      - "8080:8080"
    networks:
    - app-network	<!-- make sure they are both in same network   -->
    restart: always



in browser try to connect to your user : http://localhost:8080
	server:mariadb
	user:***
	password:***
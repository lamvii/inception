all:
	@cd srcs; sudo docker-compose up --build; cd ..

clean:
	@cd srcs; sudo docker-compose down --rmi all -v; cd ..
# fclean:
# 	if [ $(sudo docker ps -qa | wc -l ) ] ;then sudo docker stop $(sudo docker ps -aq); fi 
# 	if [ $(sudo docker ps -qa | wc -l ) ] ;then sudo docker rm $(sudo docker ps -aq); fi 
# 	if [ $(sudo docker images -aq | wc -l ) ] ;then sudo docker rmi -f $(sudo docker images -aq); fi 
# 	if [ $(docker volume ls -q | wc -l ) ] ;then sudo docker volume rm $(sudo docker volume ls -q); fi 
# 	if [ $(docker network ls -q | wc -l) ] ;then sudo docker network rm $(sudo docker network ls -q); fi
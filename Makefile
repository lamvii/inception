all:
	sudo docker-compose  -f ./srcs/docker-compose.yaml up --build

clean:
	sudo docker-compose -f ./srcs/docker-compose.yaml down --rmi all -v 
fclean:
	-@docker stop $(docker ps -aq)
	-@docker rm $(docker ps -aq)
	-@docker rmi -f $(docker images -aq)	
	-@docker volume rm $(docker volume ls -q)
	-@docker network rm $(docker network ls -q) 2>/dev/null
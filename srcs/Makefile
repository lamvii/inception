all:
	docker-compose up --build

clean:
	docker-compose down --rmi all -v

fclean: clean
	# docker stop $(docker ps -aq); docker rm $(docker ps -aq)
	# docker rmi -f $(docker images -aq); docker volume rm $(docker volume ls -q)
	# docker network rm $(docker network ls -q) 2>/dev/null
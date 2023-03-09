all:
	@cd srcs; sudo docker-compose up --build; cd ..

down:
	@cd srcs; sudo docker-compose down -v; cd ..

clean:
	@cd srcs; sudo docker-compose down --rmi all -v; cd ..

cleanV:
	sudo rm -rf /home/ael-idri/data/db/*
	sudo rm -rf /home/ael-idri/data/wp/*

fclean:
	sudo docker stop $(sudo docker ps -aq);\
	sudo docker rm $(sudo docker ps -aq); \
	sudo docker rmi -f $(sudo docker images -aq);\
	sudo docker volume rm $(sudo docker volume ls -q);\
	sudo docker network rm $(sudo docker network ls -q) 2>/dev/null

.Phony: all clean cleanV down
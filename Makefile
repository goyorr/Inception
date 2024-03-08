build: open_docker create_directories
	$(sudo) docker-compose -f srcs/docker-compose.yml up --build

down:
	$(sudo) docker-compose -f srcs/docker-compose.yml down

ls:
	@echo "- - - - - - - - - - - - volumes - - - - - - - - - - - - " && $(sudo) docker volume  ls
	@echo "- - - - - - - - - - - - images  - - - - - - - - - - - - " && $(sudo) docker image   ls
	@echo "- - - - - - - - - - - - network - - - - - - - - - - - - " && $(sudo) docker network ls
	@echo "- - - - - - - - - - - -  data   - - - - - - - - - - - - " && ([ -d ${HOME}/data ] && echo "found!" || echo "not found!")

fclean: down
	@echo "cleaning..."
	$(sudo) docker system prune                                || true
	$(sudo) docker network rm inception-v3.0.0_network         || true
	$(sudo) docker volume rm inception_v3.0.0_mariadb_volume   || true
	$(sudo) docker volume rm inception_v3.0.0_wordpress_volume || true
	$(sudo) docker image rm wordpress:v3.0.0                   || true
	$(sudo) docker image rm mariadb:v3.0.0                     || true
	$(sudo) docker image rm nginx:v3.0.0                       || true
	$(sudo) rm -rf ${HOME}/data                                || true
	@echo "done!"

open_docker:
	@echo "open docker..." && open -a Docker && sleep 1 && echo "done!" || true

create_directories:
	$(sudo) mkdir -p ${HOME}/data/volume_mariadb
	$(sudo) mkdir -p ${HOME}/data/volume_wordpress


transfer:
	@cd .. && tar -c $(folder) > $(folder)-transf.zip && scp $(folder)-transf.zip zel-kach@$(vm_ip):/home/zel-kach/Desktop


all: build datadir_delete datadir_create stop_nginx_and_up

build:
	docker-compose --file ./srcs/docker-compose.yml build

datadir_create:
	@mkdir -p $(HOME)/data/html
	@mkdir -p $(HOME)/data/mysql
	@sudo chown -R $(USER) $(HOME)/data/html
	@sudo chmod -R 777 $(HOME)/data/mysql

inceptiondir_create:
	mkdir -p srcs/requirements/mariadb/conf
	mkdir -p srcs/requirements/mariadb/script
	mkdir -p srcs/requirements/nginx/conf
	mkdir -p srcs/requirements/nginx/script
	mkdir -p srcs/requirements/wordpress/conf
	mkdir -p srcs/requirements/wordpress/script

stop_nginx_and_up:
	sudo systemctl stop nginx
	docker-compose --file ./srcs/docker-compose.yml up -d

datadir_delete:
	sudo rm -rf $(HOME)/data

abasante.42.fr:
	sudo sed -i 's|localhost|abasante.42.fr|g' /etc/hosts

localhost:
	sudo sed -i 's|abasante.42.fr|localhost|g' /etc/hosts

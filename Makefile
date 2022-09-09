build:
	gnome-terminal -- bash -c "docker-compose up --build; bash"

start:
	gnome-terminal -- bash -c "docker-compose up; bash"

stop:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)

purge:
	docker container prune

symfonyStart:
	docker exec www composer create-project symfony/website-skeleton project

symfonyShell:
	docker exec -it www bash
	cd project

symfonyDB:
	php bin/console doctrine:database:create

symfonyEntity:
	php bin/console make:entity

symfonyUser:
	php bin/console make:user

symfonyAuth:
	php bin/console make:auth

symfonyMigration:
	php bin/console make:migration

symfonyMigrate:
	php bin/console doctrine:migrations:migrate
	
symfonyController:
	php bin/console make:controller

symfonyForm:
	php bin/console make:form

symfonyRouter:
	php bin/console debug:router

symfonyEncore:
	composer require symfony/webpack-encore-bundle

symfonyNpm:
	npm install

symfonyUpRecipe:
	composer recipes:update
# Symfony_Docker

0. Cloner l'environnement
```
git clone https://github.com/MickeySaltis/Symfony_Docker
```
1. Contruire les images + Démarrage des containers
``` 
docker-compose up --build
```
2. Créer un projet Symfony + changement de propriétaire de fichier
```
docker exec www composer create-project symfony/website-skeleton project
sudo chown -R $USER ./
```
3. Mettre à jours le dossier .env du projet
```
DATABASE_URL="mysql://user:psw@db:3306/database?serverVersion=5.7=8&charset=utf8mb4"
```
4. Créer la base de donnée
```
docker exec -it www bash
cd project
php bin/console doctrine:database:create
```
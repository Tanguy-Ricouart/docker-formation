#! /bin/bash

# Un peu de ménage

docker container stop $(docker ps -q)
docker container prune -f

docker network prune -f

# Création dun réseau net_1

docker network create net_1

# Création du conteneur PHP

docker run --name php --network net_1 --rm -p 9000:9000 -d -v "$PWD/html:/srv/http" phpdockerio/php73-fpm

# Création du conteneur HTTP

docker run --name www --network net_1 --rm -p 80:80 -d \
	       -v "$PWD/html:/usr/share/nginx/html" \
	              -v "$PWD/conf/nginx.conf:/etc/nginx/nginx.conf" \
		             nginx:latest


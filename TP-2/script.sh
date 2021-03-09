#! /bin/bash

docker run --name docker-nginx --rm -p 80:80 -v /home/tanguy/docker-formation/TP-2/html:/usr/share/nginx/html:ro -d nginx

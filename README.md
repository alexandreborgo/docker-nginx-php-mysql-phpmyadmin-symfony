# docker-nginx-php-mysql-phpmyadmin-symfony

A docker multicontainer (with docker-compose) NGINX, PHP, MySQL, phpMyAdmin and Symfony ready to work.

## Installation 
Launch the symfony script (symfony.sh). 

It will download last version of Symfony.
```bash
bash install.sh
```

Then you need to build all container with this command :
```bash
docker-compose build
```
	
## Use
Then you can start the system with docker-compose :
```bash
docker-compose up
```


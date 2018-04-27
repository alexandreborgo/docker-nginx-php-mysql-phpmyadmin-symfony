

# docker-webserver
A Docker multicontainer (with docker-compose file) to set up a personnal web environment easly with Nginx, Apache2, MySQL, PHP, phpMyAdmin and Nextcloud.

## How does it work
Nginx is used as a reverse proxy for containers. I use  [jwilder](https://github.com/jwilder)/[nginx-proxy](https://github.com/jwilder/nginx-proxy) which automates the configuration of the proxy.
Working with [nginx-proxy](https://github.com/jwilder/nginx-proxy) I'm using [JrCs](https://github.com/JrCs)/[docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion). It allows the creation/renewal of [Let's Encrypt](https://letsencrypt.org/) certificates automatically.

Go see their GitHub page to learn more about these two awesome tools!

Then I use Apache2 linked with PHP-FPM (7.1), a MySQL (5.7) server and a phpMyAdmin.

I also add a [Nextcloud](https://nextcloud.com/) server (13) which is an open-source file hosting service.

Everything inside Docker containers of course!

## Installation
First download all the files and put them on your server (as the location is not a matter, you can place the files wherever you want).

Create a new folder and put the sources of your website inside it.

Then you need to complete the environment file (.env) following your need.

```bash
MYSQL_ROOT_PASSWORD=(root password)
MYSQL_DATABASE=(database name)
MYSQL_USER=(username)
MYSQL_PASSWORD=(user password)
MYSQL_HOST=(the name of the mysql container, default: mysql)

#Nextcloud
NEXTCLOUD_ADMIN_USER=(nextcloud admin username)
NEXTCLOUD_ADMIN_PASSWORD=(nextcloud admin password)

#apache2
project=(the name of the directory containing the sources of your website)
DocumentRoot=(the web root of your website)
ServerName=(domain name)
ServerAlias=(alias)
ServerAdmin=(admin email)
```

## Use
Build:
```bash
docker-compose build
```
Start:
```bash
docker-compose up
```
Start in background:
```bash
docker-compose up -d
```


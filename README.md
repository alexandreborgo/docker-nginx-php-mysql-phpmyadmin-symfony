
# docker-webserver

A docker multicontainer (with docker-compose) Apache2, PHP, MySQL, phpMyAdmin and Symfony ready to work.

## Installation
If you want Symfony you can launch the symfony script (symfony.sh).

It will download last version of Symfony.
```bash
bash symfony.sh
```
Then you need to complete the environment file (.env) following your need.

Exemple :
```bash
#MySQL
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=db
MYSQL_USER=user
MYSQL_PASSWORD=password

#apache2
project=symfony # the name of the project will be the name of folder
DocumentRoot=/var/www/html/symfony/web # DocumentRoot html by default or project_name/web for Symfony project
ServerName=mywebsite.fr
ServerAlias=www.mywebsite.fr
ServerAdmin=admin@mywebsite.fr
ssl_cert_file=/etc/apache2/ssl-certs/domain.crt # certificate file
ssl_key_file=/etc/apache2/ssl-certs/domain_private.key # private key file
ssl_interim_file=/etc/apache2/ssl-certs/domain_interim.crt # intermediate certificate file
```

All code of the website must be placed in the project folder.

All SSL certificate files must be placed in the docker-webserver/apache2 folder.


> **Note :** If you want to use only HTTPS you will need to uncomment the "Redirect permanent" line in /etc/apache2/sites-availables/000-default.conf :
> ```bash
> <VirtualHost *:80>
>     Redirect permanent / https://${ServerAlias}/
> (...)
> ```

> **Note :** If you do not want to use HTTPS you will need to comment or delete the the following lines in /etc/apache2/sites-availables/000-default.conf :
> ```bash
> <VirtualHost *:443>
>
>	  <FilesMatch \.php$>
>		 SetHandler "proxy:fcgi://php:9000"
>	  </FilesMatch>
>
>	  ServerName ${ServerName}
>	  ServerAlias ${ServerAlias}
>	  ServerAdmin ${ServerAdmin}
>	  DocumentRoot ${DocumentRoot}
>
>	  SSLEngine on
>   SSLCertificateFile /etc/apache2/ssl-certs/${ssl_cert_file}
>   SSLCertificateKeyFile /etc/apache2/ssl-certs/${ssl_key_file}
>   SSLCACertificateFile /etc/apache2/ssl-certs/${ssl_interim_file}
>
>	  <Directory ${DocumentRoot}>
>		 AllowOverride All
>		 Order Allow,Deny
>		 Allow from All
>		 Require all granted
>   </Directory>
>
>	  ErrorLog ${APACHE_LOG_DIR}/error.log
>	  CustomLog ${APACHE_LOG_DIR}/access.log combined
>
> </VirtualHost>
> ```

Finally you need to build all container with this command :
```bash
docker-compose build
```

## Use
You can start the system with docker-compose :
```bash
docker-compose up
```
Use the option -d to run containers in the background.
```bash
docker-compose up -d
```

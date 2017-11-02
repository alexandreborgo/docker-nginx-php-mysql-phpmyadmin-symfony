# download symfony
sudo mkdir -p /usr/local/bin
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

# install php7 to create a new symfony project
sudo apt-get install php7.1

# create a new symfony project
symfony new src

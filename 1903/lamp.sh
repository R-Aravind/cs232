#!/bin/bash

# update list
sudo apt update

# install my-sql
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev

# install apache server
sudo apt-get install -y apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert

# install PHP
sudo apt-get install -y libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php-pear php-imagick php7.0-mcrypt php7.0-mysql php7.0-ps php7.0-xsl

# restart apache2
sudo systemctl restart apache2


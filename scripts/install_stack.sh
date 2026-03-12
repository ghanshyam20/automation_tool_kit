#!/bin/bash

echo "Updating system packages..."
sudo apt update -y

echo "Installing required packages..."

sudo apt install -y \
apache2 \
mariadb-server \
php \
php-mysql \
php-cli \
php-curl \
php-gd \
php-mbstring \
php-xml \
php-zip \
libapache2-mod-php \
curl \
unzip \
wget

echo "Enable Apache rewrite module..."
sudo a2enmod rewrite
sudo systemctl restart apache2


echo "Preparing MariaDB runtime directory..."
sudo mkdir -p /run/mysqld
sudo chown mysql:mysql /run/mysqld


echo "Fixing MariaDB configuration directories..."

sudo mkdir -p /etc/mysql
sudo mkdir -p /etc/mysql/conf.d
sudo mkdir -p /etc/mysql/mariadb.conf.d

sudo chmod -R 755 /etc/mysql


echo "Preparing MariaDB data directory..."

sudo mkdir -p /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql


echo "Initializing MariaDB database..."

sudo mysql_install_db --user=mysql --ldata=/var/lib/mysql || true


echo "Starting MariaDB service..."

sudo systemctl daemon-reexec
sudo systemctl enable mariadb
sudo systemctl restart mariadb


echo "Waiting for MariaDB..."
sleep 5


echo "Checking MariaDB status..."

if sudo systemctl is-active --quiet mariadb
then
    echo "MariaDB started successfully."
else
    echo "MariaDB failed to start."
    sudo journalctl -xeu mariadb.service --no-pager | tail -n 20
    exit 1
fi


echo "Server stack installation completed."

#!/bin/bash

echo "Installing WordPress..."

cd /tmp

wget -q https://wordpress.org/latest.tar.gz

tar -xzf latest.tar.gz

echo "Resetting web directory..."

sudo rm -rf /var/www/html/*

sudo cp -r wordpress/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "WordPress files installed."

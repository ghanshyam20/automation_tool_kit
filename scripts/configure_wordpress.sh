#!/bin/bash


# This  will moves into Apache web server root directory , where wrodpress files are located .
cd /var/www/html

echo "Creating wp-config..."



#This will create worpress configuration , wip-cli to generate the php file automatically, this  file connects wordpress to the databases.
sudo wp config create \
--dbname=wordpress \
--dbuser=wpuser \
--dbpass=password \
--dbhost=localhost \
--allow-root

echo "Installing WordPress..."

sudo wp core install \
--url="http://localhost" \
--title="Automation Demo Site" \
--admin_user="admin" \
--admin_password="admin123" \
--admin_email="admin@example.com" \
--allow-root

echo "WordPress configured successfully."

# Everything i have done is dry run at first manually then i have automate everything.

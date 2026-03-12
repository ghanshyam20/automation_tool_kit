#!/bin/bash

cd /var/www/html

echo "Creating wp-config..."

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

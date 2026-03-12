#!/bin/bash

echo "Installing WP-CLI..."

cd /tmp

curl -s -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

sudo mv wp-cli.phar /usr/local/bin/wp

echo "WP-CLI installed successfully."

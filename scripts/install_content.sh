#!/bin/bash

cd /var/www/html

echo "Creating demo page..."

PAGE=$(sudo wp post list --post_type=page --title="Welcome" --format=ids --allow-root)

if [ -z "$PAGE" ]; then

sudo wp post create \
--post_type=page \
--post_title="Welcome" \
--post_status=publish \
--post_content="Welcome to the automated WordPress deployment demo." \
--allow-root

fi

echo "Demo content installed."

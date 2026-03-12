#!/bin/bash

set -e

echo "Starting WordPress automated deployment..."

echo "Checking OS compatibility..."

if ! grep -qi "ubuntu" /etc/os-release; then
    echo "This project supports Ubuntu/Debian only."
    exit 1
fi

echo "Fixing script permissions..."

chmod +x scripts/*.sh
chmod +x monitor/*.sh

echo "Step 1: Installing server stack..."
./scripts/install_stack.sh

echo "Step 2: Creating database..."
./scripts/setup_database.sh

echo "Step 3: Installing WordPress..."
./scripts/install_wordpress.sh

echo "Step 4: Installing WP-CLI..."
./scripts/install_wpcli.sh

echo "Step 5: Configuring WordPress..."
./scripts/configure_wordpress.sh

echo "Step 6: Installing demo content..."
./scripts/install_content.sh

echo "Step 7: System monitoring..."
./monitor/system_monitor.sh

echo ""
echo "Deployment finished successfully!"
echo ""
echo "Open browser: http://localhost"
echo ""
echo "Admin login:"
echo "Username: admin"
echo "Password: admin123"

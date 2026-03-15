Linux Web Server Automation Toolkit

Project Overview

Managing and configuring web servers manually can be time-consuming and error-prone, especially when the same setup must be repeated multiple times. System administrators often need to install web servers, configure databases, deploy applications, and verify system health. Performing these steps manually every time increases the risk of mistakes and inconsistent configurations.

This project demonstrates how Bash scripting can automate the deployment of a complete Linux web server environment. The automation toolkit installs and configures all required components for running a WordPress website, including Apache, MariaDB, PHP, and WordPress itself.

The system is designed so that a user can run one command, and the scripts will automatically perform the full deployment process.

The project also demonstrates key Linux administration concepts such as:


1)Bash scripting

2)Service management with systemctl

3)Package management using apt

4)Database creation with MariaDB

5)WordPress automation using WP-CLI

6)File permissions and ownership

7)Basic system monitoring

The final result is a fully automated WordPress deployment environment running locally on the server.

System Architecture

The system follows a modular automation design.

User → deploy.sh → automation scripts → server stack → WordPress website



The deploy.sh script acts as the main orchestrator and calls other scripts responsible for specific tasks.

Main components of the system:

User / Developer
Runs the deployment command

↓

deploy.sh (Main Orchestrator)

↓

Automation Scripts

install_stack.sh

setup_database.sh

install_wordpress.sh

install_wpcli.sh

configure_wordpress.sh

install_content.sh

↓

Web Server Environment

Apache

MariaDB

PHP

↓

WordPress CMS

↓

User Browser Access
http://localhost

Project Directory Structure


automation_tool_kit
│
├── deploy.sh
│
├── scripts
│   ├── install_stack.sh
│   ├── setup_database.sh
│   ├── install_wordpress.sh
│   ├── install_wpcli.sh
│   ├── configure_wordpress.sh
│   └── install_content.sh
│
└── monitor
    └── system_monitor.sh
    
Each script performs a specific task to keep the system modular and easier to maintain.




How To Run The Project:
git clone https://github.com/ghanshyam20/automation_tool_kit.git

Navigate into the project directory
cd automation_tool_kit

Run the deployment script
bash deploy.sh or ./deploy.sh

The script will automatically:

install Apache

install MariaDB

install PHP

download WordPress

configure the database

configure WordPress

create a demo page

check system status

After the deployment finishes, open:

http://localhost

Admin login:

Username: admin
Password: admin123


Deployment Workflow

The automation process follows these steps:

Check operating system compatibility

Fix script permissions

Install server stack

Create database

Install WordPress files

Install WP-CLI

Configure WordPress

Install demo content

Monitor system status

Each step is handled by a separate Bash script.



Main Orchestrator Script

File:

deploy.sh


This script controls the entire automation process.

Shebang
#!/bin/bash

This will tell you that linux script should run using the bash shell.


set -e 
this is error handleling 

THis command make sure that if any commands fails , the scripts stops immidiately .

This prevents partail installation of programm



Operating System Check:
if ! grep -qi "ubuntu" /etc/os-release; then
    echo "This project supports Ubuntu/Debian only."
    exit 1
fi
This code verify that the script is running on a compatiable os which i have made only for ubunut and debian


grep -qi searches for the word ubuntu.

/etc/os-release this contains os information


Fix Script Permissions

chmod +x scripts/*.sh
chmod +x monitor/*.sh

This make all the scripts are execudetable


Each line calls another scripts
./scripts/install_stack.sh
Installes the wevs erver stack


./scripts/setup_database.sh
Creates the WordPress database.

./scripts/install_wordpress.sh
This will install wordpress Files.

./scripts/install_wpcli.sh
This will istall wordpress CLI tools

./scripts/configure_wordpress.sh

this wil cnfigures wordpress and creates admin user.

./scripts/install_content.sh

Adds demo content.


./monitor/system_monitor.sh

This will Runs sytem health monitoring.

Server Stack Installation
scripts/install_stack.sh

This script installs the core web server environment

Update System
sudo apt update -y

Updates the package list.

Install Required Packages

Packages installed:

apache2 → web server

mariadb-server → database server

php → server scripting language

php extensions for WordPress

curl, wget, unzip


Example command:

sudo apt install -y apache2 mariadb-server php
Enable Apache Rewrite Module
sudo a2enmod rewrite

This allows WordPress to use clean URLs.


MariaDB Initialization

Directories for MariaDB are prepared:

/run/mysqld
/etc/mysql
/var/lib/mysql

Then the database system is initialized.


Start Database Service
sudo systemctl enable mariadb
sudo systemctl restart mariadb
This ensures MariaDb starts automatically.

Database Setup

File:

scripts/setup_database.sh

Creates the WordPress database.

Commands used:

CREATE DATABASE wordpress;
CREATE USER 'wpuser';
GRANT ALL PRIVILEGES;

This creates:

Database

wordpress

User

wpuser


Password

password

WordPress Installation

File:

scripts/install_wordpress.sh

Steps performed:

1 Download WordPress

wget https://wordpress.org/latest.tar.gz

2 Extract archive

tar -xzf latest.tar.gz

3 Copy files

/var/www/html

4 Set correct permissions

www-data:www-data

This ensures Apache can serve the website.


WP-CLI Installation

File:

scripts/install_wpcli.sh

WP-CLI allows command-line management of WordPress.

Download:

curl -O wp-cli.phar

Make executable

chmod +x wp-cli.phar

Move to system path

/usr/local/bin/wp

After this, the command

wp

can control WordPress.




WordPress Configuration

File:

scripts/configure_wordpress.sh

First it creates the WordPress configuration file.

wp config create

This generates

wp-config.php

Then WordPress is installed using:

wp core install

Parameters include:

Site URL
Admin username
Admin password
Admin email




Demo Content Installation

File:

scripts/install_content.sh

This script creates a sample page called Welcome.

Command used:

wp post create

The page includes a short message confirming that the deployment was successful.





System Monitoring

File:

monitor/system_monitor.sh

This script displays system health information.

Commands used:

Show date

date

Show uptime

uptime

Show memory usage

free -h

Show disk usage

df -h

This gives a quick knowledge  of server status after deployment

Final Result

After running the automation script, the server will have:

Apache Web Server
MariaDB Database
PHP Runtime
WordPress CMS

Accessible at

http://localhost

Future Improvements

Possible improvements for the project:

 i will make automatic backups

 i will do firewall configuration

 i will do this SSL support with Let's Encrypt

 this part i have done for another project i will do this Docker containerization

remote server deployment

CI/CD integration with GitHub Actions































#!/bin/bash

# Update the system and install required packages
sudo yum update -y
sudo yum install -y unzip wget nginx git

# Start and enable Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Navigate to the /tmp directory to download the zip file
cd /tmp

# Download the template zip file
sudo wget https://www.templateshub.net/uploaded-data/limupa-digital-products-store-ecommerce.zip

# Unzip the downloaded file
sudo unzip limupa-digital-products-store-ecommerce.zip

# Backup the existing index.html if it exists
if [ -f /usr/share/nginx/html/index.html ]; then
    sudo mv /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bkp
fi

# Move the unzipped content to the Nginx html directory
sudo mv limupa-digital-products-store-ecommerce/* /usr/share/nginx/html

# Download the script from github repo
git clone https://github.com/lnxdevsecops/scripts.git

# Run the nginx_host_ipaddr.sh script if it exists and has execute permissions
if [ -f ./nginx_host_ipaddr.sh ]; then
    sudo chmod +x ./nginx_host_ipaddr.sh
    sudo ./nginx_host_ipaddr.sh
fi

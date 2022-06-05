#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
echo "Hi" > /var/www/html/index.html
sudo systemctl restart httpd
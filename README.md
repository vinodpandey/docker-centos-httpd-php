
# Docker image with CentOS 7.9 httpd 2.4 PHP 7.4
Docker image to verify wordpress backups locally.

## DockerHub
https://hub.docker.com/repository/docker/vinodpandey/centos

## usage
pull image
```
docker pull vinodpandey/centos:1.0
```
download and import wordpress database backup to local database  
download and unzip wordpress backup files    
update below fields in wp-config.php
```
define('DB_NAME', '');
define('DB_USER', '');
define('DB_PASSWORD', '');
define('DB_HOST', 'host.docker.internal');

for Mac, host.docker.internal points to host
for Linux/Windows add host IP address
```
cd to wordpress files root directory and start container  
```
docker run -t -d -p 80:80 --name centos -v "$(pwd)":/var/www/html vinodpandey/centos:1.0
```
access http://localhost or update local hosts file 
```
127.0.0.1 example.com
```
and access http://example.com



 





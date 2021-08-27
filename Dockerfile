FROM centos:7.9.2009

MAINTAINER Vinod Pandey

# httpd
RUN yum -y install httpd

# enable rewrite rules in .htaccess file
RUN sed -i -e 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf
RUN sed -i -e 's/Options Indexes FollowSymLinks/Options -Indexes +IncludesNOEXEC +SymLinksIfOwnerMatch +ExecCGI/g' /etc/httpd/conf/httpd.conf

# php 7.4
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --enable remi-php74
RUN yum -y install php php-opcache php-xml php-devel php-mcrypt php-mbstring php-bcmath php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80





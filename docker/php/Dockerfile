FROM php:7.2.3-fpm
RUN apt-get update && apt-get install -y libpng-dev libldap2-dev && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && docker-php-ext-install mbstring gd mysqli ldap

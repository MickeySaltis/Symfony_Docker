FROM php:8.1-apache

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update \
    && apt-get install -y --no-install-recommends locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev bash nano wget zip unzip mariadb-client ca-certificates curl make coreutils nodejs npm grep sed autoconf gcc inotify-tools rsync pkgconf re2c sudo;

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

# Instalation extension Redis
RUN pecl install -o -f redis \
	&&  rm -rf /tmp/pear \
	&&  docker-php-ext-enable redis

# Instalation extension Xdebug
RUN pecl install xdebug \
	&& docker-php-ext-enable xdebug

# Composer
RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

# Php PDO Mysql
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql gd opcache intl zip calendar dom mbstring zip gd xsl
RUN pecl install apcu && docker-php-ext-enable apcu

WORKDIR /var/www/

# Variables Environnement
ENV USER=MatthieuS
ENV UID=1000
ENV USER_ID=1000
ENV GID=1000

# Variables
ARG USER=MatthieuS
ENV HOME /home/$USER

# Execution commande sudo sans mdp
RUN adduser --force-badname $USER \
	&& echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
	&& chmod 0440 /etc/sudoers.d/$USER

# Ajouter au groupe
RUN adduser $USER www-data

# Utilisateur pouvant interagir avec l'image
USER $USER

FROM php:7-fpm-alpine

# Dependencies
RUN apk --no-cache --update add \
    icu-dev \
	libxml2-dev \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	autoconf \
	g++ \
	make

# PHP extensions
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install intl
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install json
RUN docker-php-ext-install zip
RUN pecl install redis
RUN docker-php-ext-enable redis

# Composer
COPY ./getcomposer.sh /root/getcomposer.sh
RUN chmod +x /root/getcomposer.sh && \
	sh /root/getcomposer.sh && \
	mv composer.phar /usr/local/bin/composer && \
	composer --version

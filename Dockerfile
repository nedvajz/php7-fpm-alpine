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
RUN docker-php-ext-install \
	mbstring \
	intl \
	simplexml \
	pdo \
	pdo_mysql \
	gd && \
	pecl install redis && \
	docker-php-ext-enable \
	redis

# Composer
COPY ./getcomposer.sh /root/getcomposer.sh
RUN chmod +x /root/getcomposer.sh && \
	sh /root/getcomposer.sh && \
	mv composer.phar /usr/local/bin/composer && \
	composer --version

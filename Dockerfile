FROM php:7.1-fpm-alpine

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
	gd
RUN pecl install redis && \
	docker-php-ext-enable \
	redis

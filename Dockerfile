FROM php:7.1-fpm-alpine

# Install dependencies
RUN apk --no-cache --update add \
    icu-dev \
	libxml2-dev

# Install PHP extensions
RUN docker-php-ext-install mbstring intl simplexml pdo pdo_mysql

# The Build
FROM php:7.0-apache

# Force the binary layer of the stdout and stderr streams (which is available as their buffer attribute) to be unbuffered.
# The text I/O layer will still be line-buffered if writing to the console, or block-buffered if redirected to a non-interactive file.

RUN mkdir /app

WORKDIR /app

COPY php.ini /usr/local/etc/php

RUN docker-php-ext-install mysqli

COPY . /var/www/html

DATABASES = {
    'default': {
        'NAME': 'web',
        'USER': 'webuser',
        'PASSWORD': 'HUCtTVGd2qPnAHYTZc9zTKgJ',
        'HOST': 'mariadb',
        'PORT': 3306,
    }
}
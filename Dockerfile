FROM php:7.4-fpm

WORKDIR /var/www
COPY . /var/www

RUN rm -rf /var/www/html

RUN apt-get update && apt-get install -y \
    bash \
    default-mysql-client \
    zip
RUN docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]

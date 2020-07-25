FROM php:7.4-fpm

VOLUME /var/www
WORKDIR /var/www
COPY ../../ /var/www

RUN rm -rf /var/www/html

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    vim

RUN docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data: /var/www

#RUN composer install && cp .env.example .env && php artisan key:generate && php artisan migrate

RUN echo pwd: `pwd` && echo ls: `ls`

RUN composer install

RUN ln -s public html

#CMD bash -c "dasdasd composer install && php artisan key:generate && php artisan migrate"

EXPOSE 9000

ENTRYPOINT ["php-fpm"]


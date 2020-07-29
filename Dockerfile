FROM php:7.4-fpm

WORKDIR /var/www
COPY . /var/www

RUN rm -rf /var/www/html

RUN apt-get update && apt-get install -y \
    bash \
    default-mysql-client \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN chown -R www-data: /var/www

#RUN composer instal && cp .env.example .env && php artisan key:generate 

#RUN echo pwd: `pwd` && echo ls: `ls`

RUN ln -s public html

#RUN chown -R www-data: .

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]

#ADD docker-entrypoint.sh /
#RUN chmod +x /docker-entrypoint.sh
#ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD [""]

#!/bin/bash

while ! mysqladmin ping -h"db" -u"root" -p"root" --silent; do
  sleep 4
done

pushd /var/www
  php artisan migrate
popd

#/usr/local/bin/php-fpm 

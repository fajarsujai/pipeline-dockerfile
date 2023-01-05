FROM php:7.4.1-fpm

RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

COPY . /app
COPY ./run.sh /tmp
RUN composer install

EXPOSE 8000
ENTRYPOINT ["sh","run.sh"]
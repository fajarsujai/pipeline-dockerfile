#!/bin/sh

cd /app

php artisan migrate:fresh --seed
php artisan serve --host=0.0.0.0 --port=8000
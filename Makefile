docker:
	docker-compose build && docker-compose up -d --force-recreate

build:
	make docker && make composer && docker-compose exec php-fpm php artisan migrate

composer:
	docker-compose exec php-fpm composer install

migrate:
	docker-compose exec php-fpm php artisan migrate

frontend:
	docker-compose exec php-fpm npm run prod

seed:
	docker-compose exec php-fpm php artisan db:seed

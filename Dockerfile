FROM php:8.2-fpm

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Crea directorio de la app
WORKDIR /var/www/html

# Copia archivos del proyecto
COPY . /var/www/html

# Instala Laravel en subcarpeta laravel si no existe
RUN if [ ! -f /var/www/html/laravel/artisan ]; then \
    composer create-project --prefer-dist laravel/laravel /var/www/html/laravel; \
fi

# Da permisos a storage y bootstrap/cache de la subcarpeta laravel
RUN mkdir -p /var/www/html/laravel/storage /var/www/html/laravel/bootstrap/cache \
    && chown -R www-data:www-data /var/www/html/laravel/storage /var/www/html/laravel/bootstrap/cache

EXPOSE 8000

WORKDIR /var/www/html/laravel

CMD ["php", "/var/www/html/laravel/artisan", "serve", "--host=0.0.0.0", "--port=8000"]

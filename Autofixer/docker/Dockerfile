# Use the official PHP image with version 8.2 as the base image
FROM php:8.2

# Set the working directory inside the container
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer (dependency manager for PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the Laravel project files into the container
COPY . .

# Install project dependencies using Composer
RUN composer install --no-interaction --no-dev --prefer-dist

# Generate the application key
RUN cp .env.example .env
RUN php artisan key:generate


# Expose port 8000 for accessing the Laravel service
EXPOSE 8000

# Start the Laravel service
CMD php artisan serve --host=0.0.0.0 --port=8000


# Use the official PHP image as a base image
FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Copy the contents of the repository into the container
COPY . /var/www/html/

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install pdo_mysql \
    && a2enmod rewrite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install application dependencies
RUN composer install

# Expose port 80
EXPOSE 80

# Start Apache server in the foreground
CMD ["apache2-foreground"]


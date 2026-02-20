#!/usr/bin/env bash
set -e

echo "==> Running project setup..."

# Install PHP dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate application key
php artisan key:generate

# Create SQLite database if it doesn't exist
if [ ! -f database/database.sqlite ]; then
    touch database/database.sqlite
fi

# Run database migrations
php artisan migrate --force

# Install Bun dependencies
bun install

# Build frontend assets
bun run build

# Install Playwright browsers for browser testing
bun add playwright

bunx playwright install

# Create cache directories for Rector and PHPStan
mkdir -p /tmp/rector /tmp/phpstan

echo "==> Setup complete! Run 'composer dev' to start the development server."

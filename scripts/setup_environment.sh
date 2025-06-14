#!/bin/bash
set -e

# Step 1: Install Laravel
echo "Installing Laravel via Composer..."
composer create-project laravel/laravel codex-laravel

cd codex-laravel

# Step 2: Setup .env
cp .env.example .env

# Step 3: Setup SQLite
mkdir -p database
touch database/database.sqlite

# Use the correct sed syntax for macOS or Linux
DB_PATH="$(pwd)/database/database.sqlite"
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s/DB_CONNECTION=.*/DB_CONNECTION=sqlite/" .env
  sed -i '' "s|DB_DATABASE=.*|DB_DATABASE=${DB_PATH}|" .env
else
  sed -i "s/DB_CONNECTION=.*/DB_CONNECTION=sqlite/" .env
  sed -i "s|DB_DATABASE=.*|DB_DATABASE=${DB_PATH}|" .env
fi

# Step 4: Generate key
php artisan key:generate

# Step 5: Run migrations
php artisan migrate

echo "✅ Laravel project is ready in ./codex-laravel"

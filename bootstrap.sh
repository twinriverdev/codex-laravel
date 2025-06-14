#!/bin/bash
set -e

echo "Bootstrapping Codex Laravel Dev Environment..."

bash scripts/setup_environment.sh

echo "✅ Setup complete. Run 'php artisan serve' to get started."

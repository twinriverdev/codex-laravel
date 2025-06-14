# Codex Laravel Dev Setup

> A simple, reproducible setup guide to bootstrap Laravel development with Codex using SQLite and PHP 8.4.

---

## 🛠️ Features

- Laravel 11.x
- SQLite database (zero configuration)
- PHP 8.4 compatibility
- Shell scripts for bootstrapping
- Minimal dependencies, fast setup

---

## 🧑‍💻 Prerequisites

Make sure you have the following installed:

- PHP 8.4+
- Composer
- SQLite
- Git
- Bash (for running setup scripts)

---

## 🚀 Quick Start (Step-by-Step)

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/codex-laravel-dev-setup.git
   cd codex-laravel-dev-setup
   ```

2. **Run the bootstrap script** – this installs Laravel, sets up a SQLite
   database and prepares the `.env` file.
   ```bash
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

3. **Serve the application**
   The setup script leaves you inside the new `codex-laravel` directory.
   ```bash
   php artisan serve
   ```
   Open `http://localhost:8000` in your browser.

4. **Start coding!** All project files live inside the `codex-laravel`
   directory.

---

## 📂 What the Script Does

1. Installs Laravel using Composer
2. Creates `.env` with SQLite settings
3. Generates `APP_KEY`
4. Sets proper permissions
5. Runs `php artisan migrate`

---

## ⚙️ Environment

SQLite is used by default. `.env.example` is pre-configured for SQLite:

```dotenv
DB_CONNECTION=sqlite
DB_DATABASE=${PWD}/database/database.sqlite
```

---

## 📜 Scripts Overview

### `bootstrap.sh`

A master script that runs `setup_environment.sh` inside `/scripts` and finalizes the Laravel setup.

### `scripts/setup_environment.sh`

Automates Laravel install, environment config, database setup, key generation, and migration.

### Next Steps for Beginners

- Open the new `codex-laravel/.env` file to tweak configuration values.
- Run additional migrations with `php artisan migrate` as you build out features.
- Install packages using `composer require vendor/package`.

---

## 👨‍🏫 Contributing

Pull requests are welcome. For major changes, please open an issue first.

---

## 📄 License

MIT License © 2025 Twin River Development

# Laravel Codespace Template

An ultra-strict, type-safe [Laravel](https://laravel.com) starter kit configured as a GitHub Codespace template. Based on [nunomaduro/laravel-starter-kit](https://github.com/nunomaduro/laravel-starter-kit).

## What's Included

| Tool               | Version   | Purpose                      |
| ------------------ | --------- | ---------------------------- |
| PHP                | 8.5       | Runtime                      |
| Laravel            | 12        | Framework                    |
| Bun                | Latest    | JS package manager & bundler |
| Tailwind CSS       | 4         | Utility-first CSS            |
| Pest               | 4         | Testing framework            |
| PHPStan (Larastan) | Max level | Static analysis              |
| Rector             | 2         | Automated refactoring        |
| Pint               | 1         | Code formatting              |
| Prettier           | 3         | JS/CSS formatting            |
| Playwright         | Latest    | Browser testing              |
| SQLite             | Default   | Database                     |

## Getting Started

1. Click the green **"Use this template"** button, then **"Open in a codespace"**
   -- or go to **Code > Codespaces > New codespace** on the repository page.
2. Wait for the container to build and the `post-create` script to finish.
3. Start developing:

```bash
composer dev
```

This launches the Laravel server (`:8000`), queue worker, and Vite dev server (`:5173`) concurrently. The ports are auto-forwarded by Codespaces.

## Commands

### Development Server

```bash
# Start Laravel server + queue worker + Vite (all at once)
composer dev
```

This runs concurrently:

- `php artisan serve` on port **8000**
- `php artisan queue:listen --tries=1`
- `bun run dev` (Vite) on port **5173**

Press `Ctrl+C` to stop all processes.

### Running Tests

```bash
# Run the full test suite (type coverage + unit + lint + static analysis)
composer test

# Run only unit/feature tests
composer test:unit

# Run a specific test file
php artisan test --compact tests/Feature/ExampleTest.php

# Run a specific test by name
php artisan test --compact --filter=testName

# Run type coverage check (enforces 100%)
composer test:type-coverage

# Run static analysis (PHPStan max level)
composer test:types

# Lint check (dry-run, no changes)
composer test:lint
```

### Code Formatting & Linting

```bash
# Auto-fix: Rector + Pint + Prettier
composer lint

# Format PHP only
vendor/bin/pint --dirty

# Format JS/CSS only
bun run lint
```

### Database

The default database is SQLite at `database/database.sqlite`.

```bash
# Run migrations
php artisan migrate

# Reset and re-seed
php artisan migrate:fresh --seed
```

### Browser Testing (Playwright)

Playwright is pre-installed with Chromium in the codespace.

```bash
# Run browser tests
php artisan test --compact tests/Browser/

# Re-install Playwright browsers if needed
bunx playwright install --with-deps chromium
```

### Xdebug

Xdebug is installed but **disabled by default** to reduce overhead. Enable it when you need debugging or coverage:

```bash
# Enable xdebug
sudo phpenmod xdebug

# Disable xdebug
sudo phpdismod xdebug
```

### Frontend Assets

```bash
# Build for production
bun run build

# Start Vite dev server with HMR
bun run dev
```

## Project Structure

```
.
├── .devcontainer/       # GitHub Codespace config
├── app/
│   ├── Actions/         # Action classes
│   ├── Enums/           # Enum definitions
│   ├── Http/Controllers/
│   ├── Models/
│   ├── Providers/
│   └── Services/        # Service classes
├── bootstrap/
├── config/
├── database/
│   ├── database.sqlite  # Default SQLite database
│   ├── factories/
│   ├── migrations/
│   └── seeders/
├── public/
├── resources/
│   ├── css/             # Tailwind CSS v4 (CSS-first config)
│   ├── js/
│   └── views/           # Blade templates
├── routes/
├── storage/
└── tests/
    ├── Browser/          # Pest browser tests (Playwright)
    ├── Feature/
    └── Unit/
```

## Environment Configuration

The default `.env` uses lightweight drivers suitable for development:

| Service  | Driver     |
| -------- | ---------- |
| Database | `sqlite`   |
| Cache    | `database` |
| Queue    | `database` |
| Session  | `database` |
| Mail     | `log`      |

To switch to MySQL or Redis, update your `.env` and ensure the services are available.

## License

Based on **[Laravel Starter Kit](https://github.com/nunomaduro/laravel-starter-kit)** by **[Nuno Maduro](https://x.com/enunomaduro)** under the **[MIT license](https://opensource.org/licenses/MIT)**.

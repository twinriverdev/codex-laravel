#!/usr/bin/env bats

setup() {
  REPO_ROOT="$(cd "${BATS_TEST_DIRNAME}/.." && pwd)"
  TMPDIR="$(mktemp -d)"
  PATH="$TMPDIR:$PATH"

  # Stub composer to avoid network access
  cat <<'STUB' > "$TMPDIR/composer"
#!/bin/bash
if [[ "$1" == "create-project" ]]; then
  mkdir -p codex-laravel
  cd codex-laravel || exit 1
  cat > .env.example <<'EEX'
DB_CONNECTION=mysql
DB_DATABASE=/tmp/db.sqlite
EEX
  touch artisan
  exit 0
fi
exec /usr/bin/composer "$@"
STUB
  chmod +x "$TMPDIR/composer"

  # Stub php to bypass artisan commands
  cat <<'STUB' > "$TMPDIR/php"
#!/bin/bash
exit 0
STUB
  chmod +x "$TMPDIR/php"
}

teardown() {
  rm -rf "$TMPDIR"
}

@test "setup_environment.sh configures sqlite" {
  cd "$TMPDIR"
  run bash "$REPO_ROOT/scripts/setup_environment.sh"
  [ "$status" -eq 0 ]
  [ -f codex-laravel/.env ]
  grep -q "DB_CONNECTION=sqlite" codex-laravel/.env
  DB_PATH="$TMPDIR/codex-laravel/database/database.sqlite"
  grep -q "DB_DATABASE=$DB_PATH" codex-laravel/.env
}

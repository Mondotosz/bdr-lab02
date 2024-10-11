sql:
  docker compose exec -e PGPASSWORD=bdr postgresql psql --username=bdr

rsql:
  docker compose exec -e PGPASSWORD=bdr -T postgresql psql -U bdr -f - bdr < script.sql

test:
  sqlx migrate run --dry-run
  sqlx migrate revert --dry-run

run:
  sqlx migrate run

revert:
  sqlx migrate revert

revert_all:
  sqlx migrate revert --target-version 0

try:
  sqlx migrate run && sqlx migrate revert --target-version 0

format:
  #!/usr/bin/env bash
  for file in ./migrations/*.sql; do
    sql-formatter --config ./.sql-formatter.json --fix $file;
  done

sql:
  docker compose exec -e PGPASSWORD=bdr postgresql psql --username=bdr

rsql:
  docker compose exec -e PGPASSWORD=bdr -T postgresql psql -U bdr -f - bdr < script.sql

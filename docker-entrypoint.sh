#!/bin/sh

set -e

echo "-- Waiting for database..."
while ! pg_isready -U ${DB_USER:-pleroma} -d postgres://${DB_HOST:-db}:${DB_PORT:-5432}/${DB_NAME:-pleroma} -t 1; do
    sleep 1s
done

echo "-- Setting up database and migrations..."
./bin/pleroma_ctl migrate

echo "-- Starting!"
./bin/pleroma start

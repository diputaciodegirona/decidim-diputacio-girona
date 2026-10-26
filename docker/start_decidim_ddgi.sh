#!/bin/sh

# execute migrations
docker compose -f docker-compose.yml run worker bin/rails db:migrate

# generate Decidim API docs before starting services
docker compose -f docker-compose.yml run worker bundle exec rake decidim_api:generate_docs

# Clean public folder
rm -Rf /var/www/decidim-ddgi/shared/public/*

# start application, see https://docs.docker.com/reference/cli/docker/compose/up/
docker compose -f docker-compose.yml down
docker compose -f docker-compose.yml up -d --remove-orphans

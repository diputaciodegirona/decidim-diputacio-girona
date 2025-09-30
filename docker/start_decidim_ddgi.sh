#!/bin/sh

# execute migrations
docker compose --remove-orphans -f docker-compose.devel.yml run worker bin/rails db:migrate
# start application, see https://docs.docker.com/reference/cli/docker/compose/up/
docker compose -f docker-compose.devel.yml down
docker compose -f docker-compose.devel.yml up -d

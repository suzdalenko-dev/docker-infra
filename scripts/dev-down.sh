#!/usr/bin/env bash
set -euo pipefail

cd /var/www/docker-infra

docker compose -f docker/dev/docker-compose.dev.yml down

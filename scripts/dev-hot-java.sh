#!/usr/bin/env bash
set -euo pipefail

cd /var/www/docker-infra

echo "Arrancando java-service-dev..."
docker compose -f docker/dev/docker-compose.dev.yml up -d

echo ""
echo "Estado Docker:"
docker ps --filter "name=java-service-dev"

echo ""
echo "Health check:"
sleep 3
curl -f http://127.0.0.1:18081/api/java/health || true

echo ""
echo "Iniciando watcher de hot reload..."
echo "Abre otra terminal con:"
echo "  cd /var/www/docker-infra"
echo "  ./scripts/dev-logs-java.sh"
echo ""

./scripts/dev-watch-java.sh

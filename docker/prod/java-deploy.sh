#!/usr/bin/env bash
set -euo pipefail

echo "Actualizando java-service..."
cd /opt/apps/java-service
git pull

echo ""
echo "Actualizando docker-infra..."
cd /opt/apps/docker-infra
git pull

echo ""
echo "Construyendo imagen nueva y recreando contenedor..."
docker compose -f docker/prod/docker-compose.prod.yml up -d --build --force-recreate java-service

echo ""
echo "Estado:"
docker compose -f docker/prod/docker-compose.prod.yml ps java-service

echo ""
echo "Health:"
curl -f http://127.0.0.1:8080/api/
echo ""
#!/usr/bin/env bash
set -euo pipefail

echo "=== Contenedores Docker ==="
docker ps

echo ""
echo "=== Java DEV health ==="
curl -f http://127.0.0.1:18081/api/java/health

echo ""

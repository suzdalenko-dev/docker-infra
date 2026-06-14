#!/usr/bin/env bash
set -euo pipefail

docker exec -w /app java-service-dev mvn -q compile

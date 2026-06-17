Para producción, usa solo docker-infra.

Bloque bueno es este:

# Recrear solo Java

cd /opt/apps/docker-infra

docker compose -f docker-compose.prod.yml up -d --build --force-recreate java-service


# Recrear solo .NET

cd /opt/apps/docker-infra

docker compose -f docker-compose.prod.yml up -d --build --force-recreate net-service


# Recrear todo

cd /opt/apps/docker-infra

docker compose -f docker-compose.prod.yml up -d --build --force-recreate
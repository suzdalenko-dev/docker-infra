# docker-infra

Repositorio de infraestructura para servicios separados.

Este repo contiene:

- Docker Compose de desarrollo.
- Docker Compose de producción.
- Scripts operativos.
- Plantillas Apache.
- Documentación técnica.

Este repo NO contiene código Java ni código .NET.

Repos relacionados:

- java-service
- net-service

## Desarrollo

Estructura esperada:

/var/www/docker-infra
/var/www/java-service
/var/www/net-service

Java DEV:

- Código fuente: /var/www/java-service
- Puerto externo: 18081
- Puerto interno contenedor: 8080
- URL local servidor: http://127.0.0.1:18081/api/java/health
- URL desde red: http://IP_SERVIDOR:18081/api/java/health

## Producción

Estructura esperada:

/opt/apps/docker-infra
/opt/apps/java-service
/opt/apps/net-service

Java PROD:

- Artefacto: /opt/apps/java-service/release/app.jar
- Config real: /opt/docker/config/java-service/application-prod.yml
- Puerto local: 127.0.0.1:8081
- Apache decide qué rutas expone.

En producción el flujo será:

1. git pull en docker-infra
2. git pull en java-service
3. docker compose up -d o restart
# docker-infra

/opt/apps
├── java-service
└── docker-infra

cd /opt/apps/docker-infra
    docker compose -f docker/prod/docker-compose.prod.yml up -d --build


java-service:
  Dockerfile construye imagen.

docker-infra:
  docker/prod/docker-compose.prod.yml levanta contenedor.

Producción:
  image: java-service:prod
  container: java-service
  puerto: 0.0.0.0:8080->8080
  URL externa: http://IP_SERVIDOR:8080
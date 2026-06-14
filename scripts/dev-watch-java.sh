#!/usr/bin/env bash
set -u

JAVA_SERVICE_DIR="/var/www/java-service"
CONTAINER_NAME="java-service-dev"

echo "Watcher Java iniciado"
echo "Vigilando cambios en:"
echo "  ${JAVA_SERVICE_DIR}/src/main/java"
echo "  ${JAVA_SERVICE_DIR}/src/main/resources"
echo ""
echo "Cuando guardes un .java/.yml, se ejecutará mvn compile dentro del contenedor."
echo ""

while true
do
  inotifywait -r \
    -e close_write,create,delete,move \
    "${JAVA_SERVICE_DIR}/src/main/java" \
    "${JAVA_SERVICE_DIR}/src/main/resources"

  echo ""
  echo "Cambio detectado. Compilando..."

  sleep 0.5

  if ! docker ps --format '{{.Names}}' | grep -qx "${CONTAINER_NAME}"
  then
    echo "ERROR: el contenedor ${CONTAINER_NAME} no está arrancado."
    echo "Arráncalo con:"
    echo "  cd /var/www/docker-infra"
    echo "  ./scripts/dev-up.sh"
    exit 1
  fi

  docker exec -w /app "${CONTAINER_NAME}" mvn -q compile

  if [ "$?" -eq 0 ]
  then
    echo "OK: compilación correcta. Spring Boot DevTools debería reiniciar la app."
  else
    echo "ERROR: compilación fallida."
  fi

  echo ""
  echo "Esperando nuevos cambios..."
done

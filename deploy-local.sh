#!/usr/bin/env bash

# Oprește execuția dacă apare vreo eroare critică
set -e

# Configurații
IMAGE_NAME="voltronet-local"
CONTAINER_NAME="voltronet-web"
PORT_HOST="8088"
PORT_CONTAINER="80"
HEALTH_URL="http://localhost:${PORT_HOST}"

echo "=================================================="
echo "⚡ [VOLTRONET] Starting Local Build & Deploy Pipeline"
echo "=================================================="

# Pasul 1: Verificarea fișierelor esențiale
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found in the current directory!"
    exit 1
fi

if [ ! -f "Dockerfile" ]; then
    echo "❌ Error: Dockerfile not found in the current directory!"
    exit 1
fi

if [ ! -f "nginx.conf" ]; then
    echo "❌ Error: nginx.conf not found in the current directory!"
    exit 1
fi

# Pasul 2: Build imagine Docker
echo "🔨 Building Docker image: ${IMAGE_NAME}..."
docker build -t "${IMAGE_NAME}:latest" .

# Pasul 3: Curățare container vechi (dacă există)
if [ "$(docker ps -a -q -f name=^/${CONTAINER_NAME}$)" ]; then
    echo "🧹 Stopping and removing existing container (${CONTAINER_NAME})..."
    docker stop "${CONTAINER_NAME}" >/dev/null 2>&1 || true
    docker rm "${CONTAINER_NAME}" >/dev/null 2>&1 || true
fi

# Pasul 4: Rulare container nou
echo "🚀 Spinning up new container on port ${PORT_HOST}..."
docker run -d \
    --name "${CONTAINER_NAME}" \
    -p "${PORT_HOST}:${PORT_CONTAINER}" \
    --restart unless-stopped \
    "${IMAGE_NAME}:latest"

# Pasul 5: Verificare automată (Health Check cu cod HTTP 200)
echo "🔍 Testing server health at ${HEALTH_URL}..."

RETRIES=10
SLEEP_SEC=2
SUCCESS=false

for ((i=1; i<=RETRIES; i++)); do
    # Extrage codul HTTP de status
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${HEALTH_URL}" || echo "000")
    
    if [ "${HTTP_STATUS}" -eq 200 ]; then
        echo "✅ Server responded with HTTP 200 OK!"
        SUCCESS=true
        break
    else
        echo "⏳ Attempt $i/$RETRIES: Server returned status code [${HTTP_STATUS}]. Retrying in ${SLEEP_SEC}s..."
        sleep ${SLEEP_SEC}
    fi
done

if [ "$SUCCESS" = false ]; then
    echo "❌ Error: Server failed to return HTTP 200 OK within the expected timeframe."
    echo "📜 Container logs for debugging:"
    docker logs "${CONTAINER_NAME}"
    exit 1
fi

echo "=================================================="
echo "✨ Deployment Successful & Verified!"
echo "🌐 Access your local site at: ${HEALTH_URL}"
echo "=================================================="

#!/bin/bash
set -euo pipefail

VERSION="2.21.1-alpine"
PORT="${1}"
CONNECTION="${2}"
IMAGE="gcr.io/cloud-sql-connectors/cloud-sql-proxy:${VERSION}"

# start container
docker run \
  --detach \
  --net host \
  --restart on-failure \
  --name cloud-sql-proxy \
  --publish "${PORT}:${PORT}" \
  "${IMAGE}" \
  cloud-sql-proxy \
  --token "${3}" \
  --port "${PORT}" \
  "${CONNECTION}"

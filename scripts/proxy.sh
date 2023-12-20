#!/bin/bash
set -euo pipefail

VERSION="1.22.0-alpine"
PORT="${1}"
CONNECTION="${2}"
DIR="/tmp/action-google-cloud-sql-proxy"
IMAGE="gcr.io/cloudsql-docker/gce-proxy:${VERSION}"

# start container
docker run \
  --detach \
  --net host \
  --restart on-failure \
  --name cloud-sql-proxy \
  --publish "${PORT}:${PORT}" \
  --volume "${DIR}:${DIR}" \
  "${IMAGE}" \
  /cloud_sql_proxy \
  -dir "${DIR}" \
  -token "${3}" \
  -instances="${CONNECTION}=tcp:${PORT}"

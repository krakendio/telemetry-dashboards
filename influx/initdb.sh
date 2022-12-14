#!/bin/bash
# The following script creates the authentication for Grafana
# and is meant to be added to InfluxDB docker-compose.yml file.
# image: influxdb
# volumes:
# - "./config/influx:/docker-entrypoint-initdb.d"
set -e

# Retrieve the ID from the bucket created during setup
BUCKET_ID=$(influx bucket list | grep "$DOCKER_INFLUXDB_INIT_BUCKET" | awk '{print $1}')

influx v1 auth create \
  --username ${DOCKER_INFLUXDB_INIT_USERNAME} \
  --password ${DOCKER_INFLUXDB_INIT_PASSWORD} \
  --write-bucket ${BUCKET_ID} \
  --org ${DOCKER_INFLUXDB_INIT_ORG}

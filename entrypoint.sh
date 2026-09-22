#!/bin/bash
set -e

CONFIG_PATH="${RA_SPOOF_CONFIG:-/etc/ra-spoof/config.yaml}"

INFLUX_PORT="${INFLUX_PORT:-8086}"
INFLUX_ORG="${INFLUX_ORG:-rtu}"
INFLUX_TOKEN="${INFLUX_TOKEN:-605bc59413b7d5457d181ccf20f9fda15693f81b068d70396cc183081b264f3b}"
INFLUX_BUCKET="${INFLUX_BUCKET:-rtusystem}"

if [ ! -f "$CONFIG_PATH" ]; then
    echo "ERROR: Config file not found at $CONFIG_PATH"
    echo "Set RA_SPOOF_CONFIG environment variable or mount config to /etc/ra-spoof/config.yaml"
    exit 1
fi

exec /usr/local/bin/ra-spoof \
    --config "$CONFIG_PATH" \
    --influx-host "172.19.1.6" \
    --influx-port "$INFLUX_PORT" \
    --influx-org "$INFLUX_ORG" \
    --influx-bucket "$INFLUX_BUCKET" \
    --confirm-rf-isolated \
    "$@"

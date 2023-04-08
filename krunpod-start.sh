#!/bin/bash

set -Eeuo pipefail

CONFIG_PATH="$1"

if [[ ! -e $CONFIG_PATH ]] ; then
    echo "Not Found: $CONFIG_PATH"
    exit 1
fi

krunvm start podman podman -- --log-level=info system service --time=0 $(krunpod-config-start.pl "$CONFIG_PATH")

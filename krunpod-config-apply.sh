#!/bin/bash

set -Eeuo pipefail

CONFIG_PATH="$1"

if [[ ! -e $CONFIG_PATH ]] ; then
    echo "Not Found: $CONFIG_PATH"
    exit 1
fi

set -x
krunvm changevm $(krunpod-config-vm-flags.pl "$CONFIG_PATH") podman

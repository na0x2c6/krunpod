#!/bin/bash

set -Eeuxo pipefail

krunvm create --name podman containers/podman
krunvm start podman sed -- -i -e 's|^driver[[:space:]]*=.*$|driver = "vfs"|g' /etc/containers/storage.conf
krunvm start podman rm -- -rf /var/lib/containers/storage

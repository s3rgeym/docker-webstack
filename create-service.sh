#!/usr/bin/env bash
set -eu -o pipefail
SCRIPT_DIR=$(cd `dirname "$0"`; pwd -P)
SERVICE_NAME=`basename "$SCRIPT_DIR"`
COMPOSE_EXEC=`which docker-compose`

cat << EOF > "/etc/systemd/system/${SERVICE_NAME}.service"
[Unit]
Description=${SERVICE_NAME}
After=docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=${SCRIPT_DIR}
ExecStart=${COMPOSE_EXEC} up --remove-orphans -d
ExecStop=${COMPOSE_EXEC} down

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --now "$SERVICE_NAME"

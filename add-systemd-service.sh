#!/usr/bin/env bash
set -eu -o pipefail
SCRIPT_DIR=$(cd `dirname "$0"`; pwd -P)
SERVICE_NAME=`basename "$SCRIPT_DIR"`

cat << EOF > "/etc/systemd/system/${SERVICE_NAME}.service"
[Unit]
Description=${SERVICE_NAME}
After=docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=${SCRIPT_DIR}
ExecStart=$(which docker-compose) up --remove-orphans -d
ExecReload=$(which docker-compose) up --remove-orphans -d
ExecStop=$(which docker-compose) down

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --now "$SERVICE_NAME"

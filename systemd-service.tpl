[Unit]
Description=compose devstack service
After=docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=${PWD}
ExecStart=/usr/bin/docker-compose up --remove-orphans -d
ExecReload=/usr/bin/docker-compose up --remove-orphans -d
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target

#!/bin/bash
docker volume create --name sonar-data

sudo cat <<EOT>> /etc/systemd/system/sonarqube.service

[Unit]
Description=sonarqube service
After=network.target

[Service]

SyslogIdentifier=sonarqube.service
ExecStartPre=-/usr/bin/docker create --name sonarqube -p 9000:9000 -v sonar-data:/sonar-data --restart=always sonarqube:latest
ExecStart=/usr/bin/docker start -a sonarqube
ExecStop=-/usr/bin/docker stop --time=0 sonarqube

[Install]
WantedBy=multi-user.target
EOT

sudo systemctl daemon-reload
sudo systemctl start sonarqube
sudo systemctl enable sonarqube

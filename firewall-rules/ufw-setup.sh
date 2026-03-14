#!/bin/bash

echo "Example UFW config"

echo "sudo ufw default deny incoming"
echo "sudo ufw default allow outgoing"

echo "sudo ufw allow 22/tcp"
echo "sudo ufw allow 80/tcp"
echo "sudo ufw allow 443/tcp"

echo "sudo ufw enable"
echo "sudo ufw enable"

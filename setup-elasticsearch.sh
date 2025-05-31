#!/bin/bash

# Set vm.max_map_count for Elasticsearch
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Test and reload nginx
sudo nginx -t && sudo systemctl reload nginx

# Start Elasticsearch
docker compose up -d

# Wait for Elasticsearch to start
sleep 30

# Get SSL certificate
sudo certbot --nginx -d es.cydevcloud.com

echo "Elasticsearch cluster is ready!"
echo "Access via: https://es.cydevcloud.com"
echo "Username: elastic"
echo "Password: Check your .env file"
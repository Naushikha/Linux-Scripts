#!/bin/bash

echo "(*) Starting WARP service..."
systemctl start warp-svc.service
sleep 4
echo "(*) Connecting to service..."
warp-cli connect
sleep 4
echo "(*) Testing connection..."
curl https://www.cloudflare.com/cdn-cgi/trace/

read


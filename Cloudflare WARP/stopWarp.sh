#!/bin/bash

echo "(*) Disconnecting from service..."
warp-cli disconnect
sleep 4
echo "(*) Stopping WARP service..."
systemctl stop warp-svc.service
sleep 4
echo "(*) Testing connection..."
curl https://www.cloudflare.com/cdn-cgi/trace/

read


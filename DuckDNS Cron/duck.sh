#!/bin/bash

url="https://www.duckdns.org/update?domains=MY_DOMAIN&token=MY_TOKEN&ip="
response=$(curl -k "$url")
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
result="$timestamp: $response"
echo "$result" >> ~/duckdns/duck.log


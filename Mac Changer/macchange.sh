#!/bin/bash
sudo ip link set wlp2s0 down
sudo ip link set dev wlp2s0 address "3c:77:e6:8d:78:fb"
sudo ip link set wlp2s0 up

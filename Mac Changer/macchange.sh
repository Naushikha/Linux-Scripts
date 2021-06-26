#!/usr/bin/env bash
ifconfig wlp2s0 down
ifconfig wlp2s0 hw ether 3c:77:e6:8d:78:fb
ifconfig wlp2s0 up

#!/bin/bash

# I2C Values
# 2 = Monitor 1 (DisplayPort)
# 4 = Monitor 2 (HDMI)

# Values:
#     01: VGA-1
#     0f: DisplayPort-1
#     11: HDMI-1

ddcutil -b 4 setvcp 60 0x0f # DisplayPort

#!/bin/bash

# Make the card expose all channels, left, right etc.
pactl set-card-profile alsa_card.pci-0000_00_1f.3 pro-audio

# Create a sink that drains all the HDMI stereo output into left, center, right
pactl load-module module-remap-sink master_device=alsa_output.pci-alsa_output.pci-0000_01_00.1.hdmi-stereo \
                    master_channel_map=front-left,front-right,front-center \
                    channel_map=front-left,front-right,front-center remix=false \
                    sink_name=monitor_sink \
                    sink_properties="\"device.description=\\\"Sexy Monitors\\\"\""

# Load the mapping
pw-link output.monitor_sink:output_FL alsa_output.pci-0000_00_1f.3.pro-output-7:playback_AUX0 # Left
pw-link output.monitor_sink:output_FC alsa_output.pci-0000_00_1f.3.pro-output-7:playback_AUX1 # Center
pw-link output.monitor_sink:output_FC alsa_output.pci-0000_00_1f.3.pro-output-3:playback_AUX0 # Center
pw-link output.monitor_sink:output_FR alsa_output.pci-0000_00_1f.3.pro-output-3:playback_AUX1 # Right

pactl set-default-sink monitor_sink

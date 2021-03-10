#!/bin/sh
xrandr --newmode "1920x1080_74.00"  217.75  1920 2064 2264 2608  1080 1083 1088 1129 -hsync +vsync
xrandr --addmode HDMI2 "1920x1080_74.00" 
xrandr --addmode HDMI3 "1920x1080_74.00"
xrandr --output eDP1 --off --output HDMI3 --mode 1920x1080_74.00 --pos 0x581 --rotate normal --output DP2 --off --output HDMI2 --mode 1920x1080_74.00 --pos 1920x0 --rotate right --output VIRTUAL1 --off

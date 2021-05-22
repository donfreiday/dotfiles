#!/bin/sh
xrandr --newmode "1920x1080_74.00"  217.75  1920 2064 2264 2608  1080 1083 1088 1129 -hsync +vsync
xrandr --addmode DP-1-3 1920x1080_74.00
xrandr --addmode DP-1-1 1920x1080_74.00
xrandr --output eDP1 --off --output DP-1-1 --mode 1920x1080_74.00 --pos 1920x0 --rotate right --output DP-1-2 --off --output DP-1-3 --mode 1920x1080_74.00 --pos 0x567 --rotate normal --output VIRTUAL1 --off

#!/bin/sh
xrandr --newmode "1920x1080_74.00"  217.75  1920 2064 2264 2608  1080 1083 1088 1129 -hsync +vsync
xrandr --addmode DP1 "1920x1080_74.00" xrandr --addmode DP3 "1920x1080_74.00"
xrandr --addmode DP1 "1920x1080_74.00"; xrandr --addmode DP3 "1920x1080_74.00"
xrandr --output eDP1 --off --output DP1 --mode 1920x1080_74.00 --pos 0x530 --rotate normal --output DP2 --off --output DP3 --mode 1920x1080_74.00 --pos 1920x0 --rotate right --output VIRTUAL1 --off

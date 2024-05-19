#!/usr/bin/sh
# Before launch this script, you need to install xfce4
# sudo apt-get install xfce4
# if want you can use yad or dialog to input data
# sudo apt-get install yad
Xwayland :1 &
xw_pid=$!
WAYLAND_DISPLAY= DISPLAY=:1 dbus-launch startxfce4
kill $xw_pid
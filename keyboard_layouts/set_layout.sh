#!/bin/bash


sudo cp -n /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/us_backup
sudo cp "`dirname $0`"/us_erb /usr/share/X11/xkb/symbols/us
setxkbmap -layout us

echo "setxkbmap -option caps:ctrl_modifier" > $HOME/.profile


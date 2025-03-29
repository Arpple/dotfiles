#!/bin/bash
# set Caps Lock to Ctrl
setxkbmap -option ctrl:nocaps
xset r rate 220 40
steam -silent &
discord --start-minimized &

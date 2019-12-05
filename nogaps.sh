#!/bin/bash
 
 lock="/tmp/.lock-nogaps"
 
 if [[ -f "$lock" ]]; then
  echo "off"
  i3-msg gaps outer all set 15
  i3-msg gaps inner all set 15
  ~/.config/polybar/launch.sh &
  compton &
  rm $lock
 else
  echo "on"
  i3-msg gaps outer all set 0
  i3-msg gaps inner all set 0
  killall compton
  kill $(ps -AF | grep "polybar" | grep "config.ini" | awk -F ' ' '{print $2}')
  echo " " >> "$lock"
 fi


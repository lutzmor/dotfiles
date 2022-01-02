#!/usr/bin/env bash

sketchybar -m --set $NAME label="  $(pmset -g batt | grep -Eo "\d+%")"


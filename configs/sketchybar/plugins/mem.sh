#!/usr/bin/env bash

sketchybar -m --set $NAME label="  $(ps -A -o %mem | awk '{s+=$1}END{print s}')%"


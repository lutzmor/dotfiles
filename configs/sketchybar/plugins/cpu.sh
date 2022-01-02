#!/usr/bin/env bash

sketchybar -m --set $NAME label=" $(top -l 1 | awk '/CPU usage/ {print $3}')"


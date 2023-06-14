#!/usr/bin/env bash
if [[ $1 == 'true' ]]; then
  eww update notifications=false
  dunstctl set-paused true
fi

if [[ $1 == 'false' ]]; then
  eww update notifications=true
  dunstctl set-paused false
fi

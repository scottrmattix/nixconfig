#!/usr/bin/env bash

BATTERY=$(stdbuf -oL upower -e | rg 'BAT' | head -1)

INIT_CHARGE=$(stdbuf -oL upower -i "$BATTERY" | rg 'percentage' | head -1| awk '{print $2}')
echo "${INIT_CHARGE::-1}"
upower -m | while  read -r line; do
  if [[ $line == *"changed"* ]]; then
    CHARGE_PERCENT="$(stdbuf -oL upower -i "$BATTERY" | rg 'percentage' | head -1| awk '{print $2}')"
    CHARGE_PERCENT=${CHARGE_PERCENT::-1}
    echo "$CHARGE_PERCENT"
    BATTERY_STATUS="$(stdbuf -oL upower -i "$BATTERY" | rg 'state' | head -1| awk '{print $2}')"
    eww update battery_status="$BATTERY_STATUS"
    eww update battery_time="$(stdbuf -oL upower -i "$BATTERY" | rg 'time to empty|time to full' | head -1| awk '{print $4 " " $5}')"
    BATTERY_ICON=""
    case $BATTERY_STATUS in
      charging)
        BATTERY_ICON=""
        ;;
      *)
        if [ "$CHARGE_PERCENT" -le 10 ]; then
          BATTERY_ICON=""
        elif [ "$CHARGE_PERCENT" -le 40 ]; then
          BATTERY_ICON=""
        elif [ "$CHARGE_PERCENT" -le 60 ]; then
          BATTERY_ICON=""
        elif [ "$CHARGE_PERCENT" -le 80 ]; then
          BATTERY_ICON=""
        elif [ "$CHARGE_PERCENT" -le 100 ]; then
          BATTERY_ICON=""
        fi
        ;;
    esac
    eww update battery_icon="$BATTERY_ICON"
  fi
done

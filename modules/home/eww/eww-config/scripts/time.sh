#!/usr/bin/env bash
DATE=$(date '+%s')
eww update time_HHmm="$(date -d "@""$DATE" '+%I:%M %p')"
eww update time_MMddYYYY="$(date -d "@""$DATE" '+%m/%d/%+4Y')"
eww update time="$DATE"
echo "$DATE"

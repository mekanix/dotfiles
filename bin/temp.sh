#!/bin/sh

YELLOW=70
RED=80
RAW_TEMP=$(sysctl -n dev.cpu.0.temperature 2>/dev/null || sysctl -n hw.acpi.thermal.tz0.temperature 2>/dev/null)
TEMP=$(echo ${RAW_TEMP} | sed 's/C//')
WHOLETEMP=$(echo "${TEMP}" | cut -f 1 -d '.')

echo "+${TEMP}°C"
echo "+${TEMP}°C"

if [ "${WHOLETEMP}" -ge "${RED}" ]; then
  echo "#FF0000"
elif [ "${WHOLETEMP}" -ge "${YELLOW}" ]; then
  echo "#FFAA00"
fi

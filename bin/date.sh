#!/bin/sh

DATE=$(date "+%Y-%m-%d %H:%M")

case "${BLOCK_BUTTON}" in
  1|2|3)
    echo "clicked"
    echo "clicked"
    ;;
  *)
    echo "${DATE}"
    echo "${DATE}"
    ;;
esac

# if [ "${BATTERY}" -le "${RED}" ]; then
#   echo "#FF0000"
# elif [ "${BATTERY}" -le "${YELLOW}" ]; then
#   echo "#FFAA00"
# fi

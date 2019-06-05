#!/bin/sh

export DISPLAY=:0
export PATH=/bin:/usr/bin:/usr/local/bin
export LC_ALL="en_US.UTF-8"
BIN_HOME=`dirname $0`

inotifywait -e create,moved_to -q -r --monitor ~/Mail/*/*/new | while read line; do
  account=$(echo ${line} | sed -e "s;^${HOME}/Mail/;;" | cut -f 1 -d '/')
  mail_file=$(echo $line | awk '{print $1 $3}')
  from=$(egrep '^From: ' $mail_file | ${BIN_HOME}/utf-header.py)
  to=$(egrep '^To: ' $mail_file | ${BIN_HOME}/utf-header.py)
  subject=$(egrep '^Subject: ' $mail_file | ${BIN_HOME}/utf-header.py)
  notify-send -t 1500 -a "OfflineIMAP (${account})" "$from
$to
$subject"
done

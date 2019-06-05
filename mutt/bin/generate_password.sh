#!/bin/sh

set -e

stty -echo ; read -p 'Enter your password: ' PASSWORD

PROJECT_DIR=`dirname $0`/..
PROJECT_PATH=`readlink -f ${PROJECT_DIR}`
MUTT_CONFIG=${PROJECT_PATH}/conf/tilda.password

echo "set imap_pass = \"${PASSWORD}\"" >"${MUTT_CONFIG}"

#!/bin/sh

set -e

PROJECT_DIR=`dirname $0`/..
CONFIG=`readlink -f ${PROJECT_DIR}/irc.conf`
read -p 'Enter your username: ' USERNAME
stty -echo ; read -p 'Enter your password: ' PASSWORD
stty echo
echo
read -p 'Enter your server: ' SERVER
read -p 'Enter your port: ' PORT

sed -e "s:USERNAME:${USERNAME}:g" -e "s:PASSWORD:${PASSWORD}:g" -e "s:SERVER:${SERVER}:g" -e "s:PORT:${PORT}:g" ${CONFIG}.template >${CONFIG}

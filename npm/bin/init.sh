#!/bin/sh

set -e

mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

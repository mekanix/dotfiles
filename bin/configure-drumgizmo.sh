#!/bin/sh

if [ ! -f configure ]; then
  ./autogen.sh
fi

env \
  CC=cc \
  CXX=c++ \
  CPPFLAGS='-I../include -I../../include -I../src -I../../src -I/usr/local/include' \
  EXPAT_CFLAGS=-I/usr/local/include \
  EXPAT_LDFLAGS=-L/usr/local/lib \
  ZITA_CPPFLAGS=-I/usr/local/include \
  ZITA_LDFLAGS=-L/usr/local/lib \
  ./configure --with-test --enable-lv2 --enable-output-oss

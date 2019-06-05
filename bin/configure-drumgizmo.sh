#!/usr/bin/env fish

if [ ! -f configure ]
  ./autogen.sh
end

set -xg CC cc
set -xg CXX c++
set -xg CPPFLAGS '-I../include -I../../include -I../src -I../../src'
set -xg EXPAT_CFLAGS -I/usr/local/include
set -xg EXPAT_LDFLAGS -L/usr/local/lib
set -xg ZITA_CPPFLAGS -I/usr/local/include
set -xg ZITA_LDFLAGS -L/usr/local/lib
./configure --with-test --enable-lv2 --enable-output-oss

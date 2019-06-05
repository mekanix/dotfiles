#!/usr/bin/env python
from email.header import decode_header
import _locale



_locale._getdefaultlocale = (lambda *args: ['en_US', 'utf8'])


subject = input()
dh = decode_header(subject)
default_charset = 'ASCII'
result = ''
for t in dh:
    if type(t[0]) is bytes:
        result += t[0].decode('utf-8')
    else:
        result += t[0]
print(result)

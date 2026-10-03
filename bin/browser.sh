#!/bin/sh

# Don't pass Linuxulator-only libraries into native FreeBSD Firefox.
unset LD_PRELOAD LD_LIBRARY_PATH

# Firefox STUN/TURN debug output
# export R_LOG_LEVEL=9
# export R_LOG_DESTINATION=stderr
# export R_LOG_VERBOSE=1

# exec chrome --incognito --disable-infobars "$@" &
exec firefox "$@" &

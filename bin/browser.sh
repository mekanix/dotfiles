#!/bin/sh

# Firefox STUN/TURN debug output
# export R_LOG_LEVEL=9
# export R_LOG_DESTINATION=stderr
# export R_LOG_VERBOSE=1

# exec chrome --incognito --disable-infobars $@ &
# exec iridium --incognito --disable-infobars $@ &
exec firefox $@ &

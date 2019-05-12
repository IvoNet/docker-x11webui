#!/usr/bin/with-contenv bash
##############################################################################
# The nobody user
##############################################################################
# For some advanced settings you can overrule the USER_ID and GROUP_ID of
# the nobody user.
# these can be provided as environment arguments in the startup command.
##############################################################################

USERID=${USER_ID:-99}
GROUPID=${GROUP_ID:-100}
groupmod -g $GROUPID users     2>/dev/null
usermod -u $USERID nobody      2>/dev/null
usermod -g $GROUPID nobody     2>/dev/null
usermod -d /nobody nobody      2>/dev/null
chown -R nobody:users /nobody/ 2>/dev/null

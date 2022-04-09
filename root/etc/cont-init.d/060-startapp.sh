#!/command/with-contenv bash
##############################################################################
# Startapp section
##############################################################################
# This section ensures that the startup script for openbox is executable and
# owned by the nobody user.
##############################################################################

if [[ -e /startapp.sh ]]; then
	chown nobody:users /startapp.sh
	chmod +x /startapp.sh
fi

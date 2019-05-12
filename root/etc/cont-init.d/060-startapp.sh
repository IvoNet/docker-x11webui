#!/usr/bin/with-contenv bash

if [[ -e /startapp.sh ]]; then
	chown nobody:users /startapp.sh
	chmod +x /startapp.sh
fi

#!/usr/bin/with-contenv bash

echo "Creating Guacamole connection..."

# Connection name
if [ -z $APPNAME ]; then
    export APPNAME="DESKTOP_APPLICATION"
    if [[ -e /startapp.sh ]]; then
        if grep -q "/usr/bin/xeyes" "/startapp.sh"; then
          echo "The default /startapp.sh was found so falling back to eyes..."
          export APPNAME=eyes
        fi
    fi
    echo "APPNAME not set defaulting to: ${APPNAME}"
fi

sed -i "s~DESKTOP_APPLICATION~$APPNAME~g" /etc/guacamole/user-mapping.xml     2>/dev/null
sed -i "s~DESKTOP_APPLICATION~$APPNAME~g" /etc/guacamole/guacamole.properties 2>/dev/null


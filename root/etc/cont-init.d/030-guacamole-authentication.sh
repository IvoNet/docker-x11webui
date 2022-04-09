#!/command/with-contenv bash
##############################################################################
# Guacamole Authentication or Auto-login configuration section
##############################################################################
# Decide during first boot if you want authentication enabled or not.
# very easy to setup. Just add the following to your startup command.
# -e AUTH=true -e USERNAME=username -e PASSWORD=secret
##############################################################################

authentication=${AUTH:-false}
guacamole_home="/etc/guacamole"
extension="${guacamole_home}/extensions"
autologin="${extension}/ivonet-guacamole-docker-auto-login.jar"
customlogin="${extension}/ivonet-guacamole-custom-login.jar"
user_mapping="${guacamole_home}/user-mapping.xml"
properties="${guacamole_home}/guacamole.properties"

if [ -z ${USERNAME} ]; then
    export USERNAME=admin
    echo "USERNAME not set defaulting to: ${USERNAME}"
fi

if [ "${authentication}" = true ]; then
    rm -fv "${autologin}" 2>/dev/null

    sed -i "s~USERNAME~$USERNAME~g" "${user_mapping}"

    if [ -z ${PASSWORD} ]; then
        export PASSWORD=secret
        echo "PASSWORD not set defaulting to: ${PASSWORD}"
    fi
    sed -i "s~PASSWORD~${PASSWORD}~g" "${user_mapping}"

else
    rm -fv "${user_mapping}"  2>/dev/null
    rm -fv "${customlogin}"   2>/dev/null

    sed -i "s~USERNAME~${USERNAME}~g" "${properties}"
fi



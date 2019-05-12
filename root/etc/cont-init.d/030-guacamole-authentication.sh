#!/usr/bin/with-contenv bash
##############################################################################
# Guacamole Authentication or Auto-login configuration section
##############################################################################
# Decide during first boot if you want authentication enabled or not.
# very easy to setup. Just add the following to your startup command.
# -e AUTH=true -e USERNAME=username -e PASSWORD=secret
##############################################################################

echo "Setting authentication..."


authentication=${AUTH:-false}
autologin="ivonet-guacamole-docker-auto-login.jar"
guacamole_home="/etc/guacamole"
extension="${guacamole_home}/extensions/"
disabled="${guacamole_home}/disabled/"
user_mapping="user-mapping.xml"

if [ -z ${USERNAME} ]; then
    export USERNAME=admin
    echo "USERNAME not set defaulting to: ${USERNAME}"
fi

if [ "${authentication}" = true ]; then
    # Use the user_mapping.xml file

    rm -f "${extension}${autologin}"                     2>/dev/null
    mv "${disabled}${user_mapping}" "${guacamole_home}"  2>/dev/null

    sed -i "s~USERNAME~$USERNAME~g" "${guacamole_home}/${user_mapping}"

    if [ -z ${PASSWORD} ]; then
        export PASSWORD=secret
        echo "PASSWORD not set defaulting to: ${PASSWORD}"
    fi
    sed -i "s~PASSWORD~${PASSWORD}~g" "${guacamole_home}/${user_mapping}"

else
    # Use the IvoNet autologin extension
    rm -f "${guacamole_home}${user_mapping}"  2>/dev/null
    
    sed -i "s~USERNAME~${USERNAME}~g" /etc/guacamole/guacamole.properties
fi



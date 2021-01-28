#!/usr/bin/with-contenv bash
##############################################################################
# Tomcat 8 extra setup
##############################################################################
# This section will configure tomcat 8 to work as desired.
# The SERVER_PORT can be overruled to set it to your desire.
# this can be done as an environment (e.g. -e SERVER_PORT=8888) parameter in
# the startup command.
# Note that this would also overrule the EXPORTed port of the Dockerfile.v1.shellinabox and
# should therefore also be reflect in the port mapping
# e.g. -p LOCAL_PORT:SERVER_PORT
##############################################################################

# Some small fixes for the tomcat8 install
# Some needed directories
mkdir -p /var/cache/tomcat8 2>/dev/null
mkdir -p /tmp/tomcat8-tomcat8-tmp 2>/dev/null

# Sets the serverport
PORT=${SERVER_PORT:-32000}
sed -i "s~<Connector port=\"8080\" protocol=\"HTTP/1.1~<Connector port=\"${PORT}\" protocol=\"HTTP/1.1~g" /var/lib/tomcat8/conf/server.xml

# Remove almost all logging from tomcat
sed -i "s~FINE~SEVERE~g" /var/lib/tomcat8/conf/logging.properties

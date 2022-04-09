#!/usr/bin/env bash

$agi tomcat9 tomcat9-admin tomcat9-common tomcat9-user

rm -Rf /var/lib/tomcat8/webapps/ROOT 2>/dev/null
mkdir -p /usr/share/tomcat9/logs/ 2>/dev/null
touch /usr/share/tomcat9/logs/catalina.out
#!/usr/bin/env bash

$agi tomcat8

rm -Rf /var/lib/tomcat8/webapps/ROOT                        2>/dev/null
mkdir -p /var/cache/tomcat8                                 2>/dev/null
mkdir -p /tmp/tomcat8-tomcat8-tmp                           2>/dev/null

# gave warnings during stardup (wrong simlinks)
rm -rf /usr/share/tomcat8/lib/commons-dbcp.jar              2>/dev/null
rm -rf /usr/share/tomcat8/lib/commons-pool.jar              2>/dev/null

mkdir -p /var/lib/tomcat8/common/classes                    2>/dev/null
mkdir -p /usr/share/tomcat8/server/classes                  2>/dev/null

chown -R tomcat8:tomcat8 /var/lib/tomcat8                   2>/dev/null
chown -R tomcat8:tomcat8 /usr/share/tomcat8                 2>/dev/null


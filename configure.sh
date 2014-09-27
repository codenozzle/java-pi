#!/bin/sh
from="#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk"
to="JAVA_HOME=/usr/lib/jvm/default-java"

sed -i 's/$from/$to/g' /etc/default/tomcat7
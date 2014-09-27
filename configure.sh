#!/bin/sh
sudo sed -i 's!#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk!JAVA_HOME=/usr/lib/jvm/default-java!g' /etc/default/tomcat7

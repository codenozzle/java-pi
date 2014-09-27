#!/bin/sh

echo 'Starting installation of Java Pi'
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install tomcat7-common tomcat7 tomcat7-docs tomcat7-admin tomcat7-examples libtomcat6-java libjetty-extra-java mysql-server mysql-client libhibernate3-java libguava-java groovy gradle maven ant git vim chromium-browser

sudo apt-get clean
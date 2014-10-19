#!/bin/bash
printf "Starting installation of Java Pi\n"
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/configure.sh
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/syncAndBuild.sh
chmod 755 *.sh

printf "Updating Raspberry Pi Packages\n"
sudo apt-get update
sudo apt-get upgrade

printf "Install Java-Pi Dependent Packages\n"
sudo apt-get install libtomcat8-java tomcat8-common tomcat8 tomcat8-docs tomcat8-admin tomcat8-examples mysql-server mysql-client libhibernate3-java libguava-java groovy maven ant git vim chromium-browser vsftpd
sudo apt-get clean

printf "Choose Java Version\n"
sudo update-alternatives --config java

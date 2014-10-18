#!/bin/bash
stepCount=1

printf "Starting installation of Java Pi\n"
printf "================================\n\n"

printf "Step $stepCount: Updating Raspberry Pi Packages\n"
printf "===============================================\n"
sudo apt-get update
sudo apt-get upgrade
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Install Java-Pi Dependent Packages\n"
printf "======================================\n"
sudo wget http://supergsego.com/apache/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz
sudo tar xvzf apache-tomcat-7.0.56.tar.gz
sudo apt-get install libtomcat7-java tomcat7-common tomcat7 tomcat7-docs tomcat7-admin tomcat7-examples mysql-server mysql-client libhibernate3-java libguava-java groovy maven ant git vim chromium-browser vsftpd
sudo rm -rf /usr/share/tomcat7/bin
sudo rm -rf /usr/share/tomcat7/lib
sudo mv apache-tomcat-7.0.56/* /usr/share/tomcat7
sudo apt-get clean
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Choose Java Version\n"
printf "============================\n"
sudo update-alternatives --config java
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Java Info\n"
printf "==========================\n"
java -version
which java
printf "\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Downloading Configuration Script\n"
printf "============================\n"
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/configure.sh
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/syncAndBuild.sh
chmod 755 *.sh
./configure.sh

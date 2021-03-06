#!/bin/bash
printf "Starting installation of Java Pi\n"
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/configure.sh
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/syncAndBuild.sh
wget https://raw.githubusercontent.com/codenozzle/java-pi/master/scripts/tomcat-service.sh
chmod 755 *.sh

printf "Updating Raspberry Pi Packages\n"
sudo apt-get update
sudo apt-get upgrade

printf "Install Java-Pi Dependent Packages\n"
sudo wget http://apache.mirrors.hoobly.com/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz
sudo tar xvzf apache-tomcat-7.0.57.tar.gz
sudo apt-get install -y maven ant git
sudo mkdir /usr/share/tomcat7
sudo mv apache-tomcat-7.0.57/* /usr/share/tomcat7
sudo rm -rf apache-tomcat-7.0.57*
sudo apt-get clean

printf "Choose Java Version\n"
sudo update-alternatives --config java

./configure.sh

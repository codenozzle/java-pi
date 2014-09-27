#!/bin/sh
stepCount=1

printf "Starting installation of Java Pi\n"
printf "=================================\n"

printf "Step $stepCount: Updating Raspberry Pi Packages\n"
sudo apt-get update
sudo apt-get upgrade
printf "Done\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Install Java Packages\n"
sudo apt-get install libtomcat7-java tomcat7-common tomcat7 tomcat7-docs tomcat7-admin tomcat7-examples mysql-server mysql-client libhibernate3-java libguava-java groovy maven ant git vim chromium-browser
sudo update-alternatives --config java
printf "Done\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Cleaning Up\n"
sudo apt-get clean
printf "Done\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Java Info\n"
java -version
which java
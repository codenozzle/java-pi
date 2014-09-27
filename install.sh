#!/bin/sh
stepCount=1

printf "Starting installation of Java Pi"
printf "=================================\n"

printf "Step $stepCount: Updating Raspberry Pi Packages"
sudo apt-get update
sudo apt-get upgrade
printf "Done\n"
stepCount++

printf "Step $stepCount: Install Java Packages"
sudo apt-get install libtomcat7-java tomcat7-common tomcat7 tomcat7-docs tomcat7-admin tomcat7-examples mysql-server mysql-client libhibernate3-java libguava-java groovy maven ant git vim chromium-browser
sudo update-alternatives --config java
printf "Done\n"
stepCount++

printf "Step $stepCount: Cleaning Up"
sudo apt-get clean
printf "Done\n"
stepCount++

printf "Step $stepCount: Java Info"
java -version
which java
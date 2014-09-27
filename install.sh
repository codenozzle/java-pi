#!/bin/sh

echo 'Starting installation of Java Pi'
echo '================================='
echo ''

echo 'Step 1: Updating Raspberry Pi Packages'
sudo apt-get update
sudo apt-get upgrade
echo ''

echo 'Step 2: Install Java Packages'
sudo apt-get install libtomcat6-java libtomcat7-java tomcat7-common tomcat7 tomcat7-docs tomcat7-admin tomcat7-examples libjetty-extra-java mysql-server mysql-client libhibernate3-java libguava-java groovy gradle maven ant git vim chromium-browser
echo ''

echo 'Step 3: Cleaning Up'
sudo apt-get clean
echo ''

echo 'Step 4: Java Info'
java -version
which java
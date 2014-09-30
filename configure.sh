#!/bin/bash
stepCount=1

printf "Starting configuration of Java Pi\n"
printf "================================\n\n"

printf "Step $stepCount: Setting Tomcat Java Home\n"
printf "===============================================\n"
sudo sed -i 's!#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk!JAVA_HOME=/usr/lib/jvm/default-java!g' /etc/default/tomcat7
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Setting Java Bash Variables\n"
printf "===============================================\n" 
sudo echo 'export JAVA_HOME=/usr/lib/jvm/default-java' >> ~/.bashrc
sudo echo 'export CATALINA_HOME=/etc/tomcat7' >> ~/.bashrc
. ~/.bashrc
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Setting Tomcat Default Manager GUI User\n"
printf "===============================================\n"
newUser='<user username="system" password="raspberry" roles="manager-gui"/>'
sudo sed -i "s|\(</tomcat-users>\)|${newUser//$'\n'/\n}\1|{G;}" /etc/tomcat7/tomcat-users.xml
printf "Done\n\n"
stepCount=$((stepCount+1))

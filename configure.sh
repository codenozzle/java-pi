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
#oldXml="<tomcat-users>.*</tomcat-users>"
newXml="<tomcat-users><user username=\"system\" password=\"raspberry\" roles=\"manager-gui\"/></tomcat-users>"
#sudo sed -i "s|\(<tomcat-users>\)*\(</tomcat-users>\)|\1${newXml}\2|" /etc/tomcat7/tomcat-users.xml
#sudo sed -i 's!(<tomcat-users>)[^<>]*(</tomcat-users>)!<tomcat-users>SOMETHING</tomcat-users>!' /etc/tomcat7/tomcat-users.xml
#sudo sed -i '/hibernate.connection.password/ s/\(\).*\(\)/\1NewPassword\2/' confluence.cfg.xml
sed -i "s/\(<tomcat-users.*>\).*\(<\/tomcat-users.*\)/\1$newXml\2/" /etc/tomcat7/tomcat-users.xml
printf "Done\n\n"
stepCount=$((stepCount+1))

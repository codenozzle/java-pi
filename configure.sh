#!/bin/bash
stepCount=1

printf "Starting configuration of Java Pi\n"
printf "================================\n\n"

printf "Step $stepCount: Setting Tomcat Java Home\n"
printf "===============================================\n"
sudo sed -i 's|#JAVA_HOME=/usr/lib/jvm/openjdk-6-jdk|JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt|g' /etc/default/tomcat7
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Setting Java Bash Variables\n"
printf "===============================================\n" 
sudo echo 'export JAVA_HOME= /usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt' >> ~/.bashrc
sudo echo 'export CATALINA_HOME=/usr/share/tomcat7' >> ~/.bashrc
sudo echo 'export WEBAPP_HOME=/var/lib/tomcat7/webapps/ROOT' >> ~/.bashrc
. ~/.bashrc
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Setting Tomcat Users\n"
printf "===============================================\n"
newManagerGuiUser="<user username=\"pi\" password=\"raspberry\" roles=\"manager-gui\"/>\n"
sudo sed -i "s|\(</tomcat-users>\)|${newManagerGuiUser}\1|g" /etc/tomcat7/tomcat-users.xml
newAdminGuiUser="<user username=\"pi\" password=\"raspberry\" roles=\"admin-gui\"/>\n"
sudo sed -i "s|\(</tomcat-users>\)|${newAdminGuiUser}\1|g" /etc/tomcat7/tomcat-users.xml
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Cloning Java-Pi code from GitHub\n"
printf "===============================================\n"
cd $WEBAPP_HOME
sudo git clone https://git@github.com/codenozzle/java-pi.git
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Building app\n"
printf "===============================================\n"
mvn package
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Step $stepCount: Restarting Tomcat\n"
printf "===============================================\n"
sudo service tomcat7 restart
printf "Done\n\n"
stepCount=$((stepCount+1))

printf "Configuration Complete\n"
printf "===============================================\n"
ipAddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
printf "View the application at: http://${ipAddress}\n\n"

#!/bin/bash
printf "Starting configuration of Java Pi\n"
printf "Setting Java Bash Variables\n" 
sudo echo 'export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt' >> ~/.bashrc
sudo echo 'export CATALINA_HOME=/usr/share/tomcat7' >> ~/.bashrc
sudo echo 'export WEBAPP_HOME=/usr/share/tomcat7/webapps/ROOT/webapp' >> ~/.bashrc
. ~/.bashrc

printf "Setting Tomcat Users\n"
newAdminGuiUser="<user username=\"pi\" password=\"raspberry\" roles=\"manager-gui, admin-gui\"/>\n"
sudo sed -i "s|\(</tomcat-users>\)|${newAdminGuiUser}\1|g" /usr/share/tomcat-7/conf/tomcat-users.xml

printf "Cloning Java-Pi code from GitHub\n"
cd /usr/share/tomcat7/webapps/ROOT
sudo rm -rf *
sudo git clone https://git@github.com/codenozzle/java-pi.git .

printf "Starting Maven Build\n"
sudo mvn clean install

printf "Restarting Tomcat\n"
cd /home/pi
./tomcat-service restart

printf "Configuration Complete\n"
ipAddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
java -version
which java
printf "\n"
printf "View the application at: http://${ipAddress}:8080\n\n"

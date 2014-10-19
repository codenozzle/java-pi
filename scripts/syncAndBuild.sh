#!/bin/bash
printf "Updating Java-Pi code from GitHub\n"
cd /usr/share/tomcat7/webapps/ROOT
sudo git fetch --all
sudo git reset --hard origin/master

printf "Starting Maven Build\n"
sudo mvn clean install

printf "Restarting Tomcat\n"
sudo service tomcat7 restart

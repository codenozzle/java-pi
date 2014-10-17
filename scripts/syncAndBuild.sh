#!/bin/bash
printf "Updating Java-Pi code from GitHub\n"
printf "===============================================\n"
cd /var/lib/tomcat7/webapps/ROOT
sudo git pull
printf "Done\n\n"

printf "Starting Maven Build\n"
printf "===============================================\n"
sudo mvn clean install
printf "Done\n\n"

printf "Step $stepCount: Restarting Tomcat\n"
printf "===============================================\n"
sudo service tomcat7 restart
printf "Done\n\n"

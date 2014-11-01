#!/bin/bash
export CATALINA_HOME=/usr/local/apache-tomcat-7.0.47
PATH=/sbin:/bin:/usr/sbin:/usr/bin
start() {
 sudo sh $CATALINA_HOME/bin/startup.sh
}
stop() {
 sudo sh $CATALINA_HOME/bin/shutdown.sh
}
case $1 in
  start|stop) $1;;
  restart) stop; start;;
  *) echo "Run as $0 <start|stop|restart>"; exit 1;;
esac

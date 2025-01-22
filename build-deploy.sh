#!/bin/bash

rm -rf hello-world-war
git clone https://github.com/AHP1609/hello-world-war.git  
cd hello-world-war
mvn clean package


sudo cp /target/hello-world-war-1.0.0.war /opt/tomcat/apache-tomcat-10.1.34/webapps/


sudo bash   /opt/tomcat/apache-tomcat-10.1.34/bin/shutdown.sh
sudo bash   /opt/tomcat/apache-tomcat-10.1.34/bin/startup.sh

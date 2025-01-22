#!/bin/bash
echo "enter the repo that is to be deployed"
read repo
rm -rf $repo
echo "enter the url of the remote repo"
read url
git clone $url
cd $repo
mvn clean package
sudo cp /target/*.war /opt/tomcat/apache-tomcat-10.1.34/webapps/


sudo bash   /opt/tomcat/apache-tomcat-10.1.34/bin/shutdown.sh
sudo bash   /opt/tomcat/apache-tomcat-10.1.34/bin/startup.sh

#!/bin/bash
# Author: Landmark Technology
# CentOs or REHEL 7/8
#  Install JAVA pre-requisite
sudo hostname sonar
cd /opt
sudo yum -y install unzip wget git
sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
#Download the SonarqQube Server software. 
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
sudo useradd sonar
# Grand sudo access to sonar user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
# start sonarqube as sonar user using relative path
sudo su - sonar  
cd /opt/sonarqube/bin/linux-x86-64/ 
sh sonar.sh start
# or start sonarqube as sonar user using sonar.sh absolute path
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status


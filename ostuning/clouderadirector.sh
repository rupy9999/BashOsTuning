#!/bin/bash

sudo yum -y update
sudo yum -y install vim wget
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn/java/jdk/8u221-b11/230deb18db3e4014bb8e3e8324f81b43/jdk-8u221-linux-x64.rpm
sudo yum -y localinstall jdk-8u181-linux-x64.rpm
java -version
cd /etc/yum.repos.d/
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo"
cd
sudo yum  -y install cloudera-director-server cloudera-director-client
sudo service cloudera-director-server start


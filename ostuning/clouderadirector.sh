#!/bin/bash

sudo yum -y update
sudo yum -y install vim wget
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
sudo yum -y localinstall jdk-8u181-linux-x64.rpm
java -version
cd /etc/yum.repos.d/
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo"
cd
sudo yum  -y install cloudera-director-server cloudera-director-client
sudo service cloudera-director-server start


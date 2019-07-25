#!/bin/bash

sudo yum -y update
sudo yum -y install vim wget
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum -y localinstall jdk-8u131-linux-x64.rpm
java -version
cd /etc/yum.repos.d/
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo"
cd
sudo yum  -y install cloudera-director-server cloudera-director-client
sudo service cloudera-director-server start


#!/bin/bash

sudo yum -y update
sudo yum -y install vim wget
sudo sh -c  "echo 'slave3.rupeshorg.net' > /etc/hostname"
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
sudo sh -c "echo 'NETWORKING_IPV6=no' >> /etc/sysconfig/network"
sudo sh -c "echo 'HOSTNAME=slave3.rupeshorg.net' >> /etc/sysconfig/network"
sudo sh -c "echo 'vm.swappiness = 0' >> /etc/sysctl.conf"
sudo chmod +x /etc/rc.d/rc.local
sudo sh -c "echo 'echo never > /sys/kernel/mm/transparent_hugepage/defrag' >> /etc/rc.local"
sudo sh -c "echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local"
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
sudo yum -y localinstall jdk-8u181-linux-x64.rpm
java -version
sudo adduser hduser
sudo sh -c "echo admin | passwd hduser --stdin"
sudo sh -c "echo 'hduser          ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers"
sudo ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
sudo sh -c  "echo 'ZONE="America/Los_Angeles"' > /etc/sysconfig/clock"
sudo yum -y install ntp
sudo sed -i 21,24d /etc/ntp.conf
sudo sed -i '21i server 0.us.pool.ntp.org' /etc/ntp.conf
sudo sed -i '22i server 1.us.pool.ntp.org' /etc/ntp.conf
sudo sed -i '23i server 2.us.pool.ntp.org' /etc/ntp.conf
sudo sed -i '24i server 3.us.pool.ntp.org' /etc/ntp.conf
sudo systemctl status ntpd
sudo systemctl start ntpd
sudo systemctl status ntpd
hostname
ntpdate -q  server 1.us.pool.ntp.org
date -R
timedatectl
ntpq -pn
sestatus

#! /bin/bash
# shellcheck disable=SC2164
wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
 
sudo rpm -Uvh mysql80-community-release-el9-1.noarch.rpm
 
sudo dnf --disablerepo=* --enablerepo=mysql80-community install mysql-community-client -y
mysql --version

cd /home/ec2-user ||exit 1
sudo dnf update -y
sudo dnf install python3 python3-pip git
git clone https://github.com/kirtiprajapat/python-mysql-db-proj-1.git  
sleep 10
# shellcheck disable=SC2164
cd python-mysql-db-proj-1
pip3 install -r requirements.txt
echo 'Waiting for 30 seconds before running the app.py'
setsid python3 -u app.py &
sleep 10

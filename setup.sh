#!/usr/bin/env bash

#"i686" or "x86_64"
machine=`uname -m`
if [ $machine = "x86_64" ] ; then 
  bits="64"; 
elif [ $machine = "i686" ] ; then 
  bits="32"; 
fi;

# Update repositories
sudo apt-get update
sudo apt-get -y upgrade

# Install required packages
sudo apt-get install --yes --force-yes python python2.7-dev python-pyasn1 libxml2-dev libxslt1-dev python-setuptools python-mysqldb screen libxss-dev xvfb chromium-browser
sudo easy_install pip
sudo pip install mitmproxy
sudo pip install pyOpenssl
sudo pip install selenium

# Create symbolic link
ln -s `pwd` ~/fpbase

# Install mysql server and phpmyadmin preventing password propmt by setting password beforehand ('fpdetective')
echo 'mysql-server-5.5 mysql-server/root_password password fpdetective' | sudo debconf-set-selections
echo 'mysql-server-5.5 mysql-server/root_password_again password fpdetective' | sudo debconf-set-selections
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password fpdetective' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password fpdetective' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password fpdetective' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
sudo apt-get -y install --yes --force-yes apache2 php5 libapache2-mod-php5
sudo /etc/init.d/apache2 restart
sudo apt-get -y install --yes --force-yes mysql-server phpmyadmin

# Generate mysql schema
mysql -u root --password=fpdetective < db/create_fp_database.sql

# Download alexa top 1m
mkdir run
cd run
wget http://s3.amazonaws.com/alexa-static/top-1m.csv.zip
unzip top-1m.csv.zip
sudo rm -f top-1m.csv.zip

# Download browser binaries from git repo

mkdir jobs
mkdir logs
mkdir bins
cd bins

#phantom
mkdir phantomjs
cd phantomjs
wget "https://github.com/fpdetective/phantomjs/releases/download/v1.9/phantomjsm$bits.tar.gz"
tar -xzf "phantomjsm$bits.tar.gz"
sudo rm -f "phantomjsm$bits.tar.gz"

# chromium
cd ..
wget "https://github.com/fpdetective/phantomjs/releases/download/v1.9/chromium$bits.tar.gz"
tar -xzf "chromium$bits.tar.gz"
sudo rm -f "chromium$bits.tar.gz"

# setup chromedriver
mkdir chromedriver
cd chromedriver
wget "http://chromedriver.storage.googleapis.com/2.5/chromedriver_linux$bits.zip"
unzip "chromedriver_linux$bits.zip"
sudo rm -f "chromedriver_linux$bits.zip"

cd ..
wget https://github.com/n1k0/casperjs/zipball/1.0.3
unzip 1.0.3
mv n1k0-casperjs-76fc831/ casperjs
rm 1.0.3

cd ..
mkdir ffdec
cd ffdec
wget http://www.free-decompiler.com/flash/download/ffdec_1.7.3u2.zip
unzip ffdec_1.7.3u2.zip
sudo rm -f ffdec_1.7.3u2.zip

cd ../..

echo "The setup script has finished."

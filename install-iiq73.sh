#!/bin/bash

# Install MariaDB
sudo apt install mariadb-server -y
echo <<< EOL
[mysqld]
max_allowed_packet=32M\n
EOL >> /etc/my.cnf

sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb
sudo mysql_secure_installation


# Install Java
sudo apt install openjdk-8-jdk -y

# Install Tomcat

# set up user
sudo useradd -m -U -d /opt/tomcat -s /sbin/nologin tomcat

# setup apache tomcat
cd /tmp
wget http://apache.hippo.nl/tomcat/tomcat-9/v9.0.19/bin/apache-tomcat-9.0.19.tar.gz
tar -xf apache-tomcat-9.0.19.tar.gz
sudo mv apache-tomcat-9.0.19 /opt/tomcat/
sudo ln -s /opt/tomcat/apache-tomcat-9.0.19 /opt/tomcat/latest
sudo chown -R tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

# create systemctl tomcat service
echo <<< EOL
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOL >> /etc/systemd/system/tomcat.service

#sudo vi /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
sudo systemctl status tomcat

sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

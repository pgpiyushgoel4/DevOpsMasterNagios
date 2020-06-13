sudo apt-get update
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php  
sudo apt-get install -y	libapache2-mod-php7.2 libgd-dev
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagios,nagcmd www-data
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz
tar xzf nagioscore.tar.gz
cd nagioscore-nagios-4.4.5/
./configure --with-nagios-group=nagios --with-command-group=nagcmd
sudo make all
sudo make install
sudo make install-daemoninit
sudo make install-commandmode
sudo make install-config
sudo /usr/bin/install -c -m 644 sample-config/httpd.conf  \ 
	/etc/apache2/sites-available/nagios.conf
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/
sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi
sudo ufw allow Apache
sudo ufw reload
sudo apt-get install -y autoconf gcc libc6 libmcrypt-dev make \ 
	libssl-dev wget bc gawk dc build-essential snmp \ 
	libnet-snmp-perl gettext
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz \ 
  https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz
cd nagios-plugins-release-2.2.1/
sudo ./tools/setup
./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
sudo make
sudo make install
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo systemctl restart apache2.service
sudo systemctl start nagios.service
sudo systemctl stop nagios.service
sudo systemctl restart nagios.service
sudo systemctl status nagios.service

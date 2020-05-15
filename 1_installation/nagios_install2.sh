sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo a2enconf nagios
sudo a2enmod cgi rewrite
sudo service apache2 restart
wget http://www.nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
sudo tar xzf nagios-plugins-2.2.1.tar.gz
cd nagios-plugins-2.2.1
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
sudo make
sudo make install
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

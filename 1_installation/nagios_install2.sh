cd ~/downloads
tar xzf nagios-plugins-2.1.3.tar.gz
cd nagios-plugins-2.1.3

./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install

ln -s /etc/init.d/nagios /etc/rcS.d/S99nagios

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

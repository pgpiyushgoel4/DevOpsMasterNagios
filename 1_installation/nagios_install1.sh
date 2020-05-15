sudo apt-get update
sudo apt-get install apache2 php build-essential libgd-dev
/usr/sbin/groupadd nagios
/usr/sbin/usermod -G nagios nagios

/usr/sbin/groupadd nagcmd
/usr/sbin/usermod -a -G nagcmd nagios
/usr/sbin/usermod -a -G nagcmd www-data

mkdir ~/downloads
cd ~/downloads
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.2.1.tar.gz
wget http://prdownloads.sourceforge.net/sourceforge/nagiosplug/nagios-plugins-2.1.3.tar.gz

cd ~/downloads
tar xzf nagios-4.2.1.tar.gz
cd nagios-4.2.1

./configure --with-command-group=nagcmd

make all

make install
make install-init
make install-config
make install-commandmode

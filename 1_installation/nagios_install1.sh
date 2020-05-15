sudo apt-get update
sudo apt-get install wget build-essential unzip openssl libssl-dev
sudo apt-get install apache2 php libapache2-mod-php php-gd libgd-dev
sudo adduser nagios_user
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios_user
sudo usermod -a -G nagcmd www-data
cd /opt
sudo wget https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios4.4.3/nagios-4.4.3.tar.gz
tar xzf nagios-4.4.3.tar.gz
cd nagios-4.4.3
sudo ./configure --with-command-group=nagcmd
sudo make all
sudo make install
sudo make install-init
sudo make install-daemoninit
sudo make install-config
sudo make install-commandmode
sudo make install-exfoliation
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/
sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers


sudo apt-get update
sudo apt-get install wget build-essential unzip openssl libssl-dev
sudo apt-get install apache2 php libapache2-mod-php php-gd libgd-dev
sudo adduser nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagcmd www-data
cd /opt
sudo wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.2.0.tar.gz
sudo tar xzf nagios-4.2.0.tar.gz
cd nagios-4.2.0
sudo ./configure --with-command-group=nagcmd
sudo make all
sudo make install
sudo make install-init
sudo make install-daemoninit
sudo make install-config
sudo make install-commandmode
sudo make install-exfoliation
sudo /usr/bin/install -c -m 644 sample-config/httpd.conf /etc/apache2/sites-available/nagios.conf
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/


#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y net-tools autoconf gcc make libpcre3-dev \
    zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev \
    libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool


### Installing Snort:

mkdir ~/snort_src

cd ~/snort_src

wget https://www.snort.org/downloads/snort/daq-2.0.7.tar.gz

tar -xvzf daq-2.0.7.tar.gz

cd daq-2.0.7

autoreconf -f -i

./configure
make
sudo make install

cd ~/snort_src

wget https://www.snort.org/downloads/snort/snort-2.9.16.tar.gz

tar -xvzf snort-2.9.16.tar.gz

cd snort-2.9.16

./configure --enable-sourcefire

make

sudo make install

### Configuring Snort to run in NIDS mode:

sudo ldconfig

sudo ln -s /usr/local/bin/snort /usr/sbin/snort


### Setting up username and folder structure

sudo groupadd snort

sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort

sudo mkdir -p /etc/snort/rules
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules

sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
sudo chown -R snort:snort /etc/snort
sudo chown -R snort:snort /var/log/snort
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules

sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
sudo touch /etc/snort/rules/local.rules

sudo cp ~/snort_src/snort-2.9.16/etc/*.conf* /etc/snort
sudo cp ~/snort_src/snort-2.9.16/etc/*.map /etc/snort

### Configur network interfaces and routes:

ifconfig enp0s8:0 10.0.0.100
route add -net 172.89.0.0/24 dev enp0s8

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

sysctl net.ipv4.ip_forward

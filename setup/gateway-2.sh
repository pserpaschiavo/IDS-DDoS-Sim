#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt install -y net-tools gcc make build-essential libpcap-dev libpcre3-dev \
    libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex \
    liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest \
    libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev \
    autotools-dev libluajit-5.1-dev libunwind-dev libfl-dev


### Installing Snort:

mkdir -p /home/vagrant/snort_src
cd /home/vagrant/snort_src

git clone https://github.com/snort3/libdaq.git
cd /home/vagrant/snort_src/libdaq
./bootstrap
./configure
make
sudo make install

cd /home/vagrant/snort_src

wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
tar xzf gperftools-2.9.1.tar.gz
cd gperftools-2.9.1/
./configure
make
sudo make install

cd..
wget https://github.com/snort3/snort3/archive/refs/heads/master.zip
unzip master.zip
cd snort3-master
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc

cd build
make
sudo make installls 

### Configuring Snort to run in NIDS mode:

sudo ldconfig

snort -V

snort -c /usr/local/etc/snort/snort.lua

# sudo ln -s /usr/local/bin/snort /usr/sbin/snort


# ### Setting up username and folder structure

# sudo groupadd snort

# sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort

# sudo mkdir -p /etc/snort/rules
# sudo mkdir /var/log/snort
# sudo mkdir /usr/local/lib/snort_dynamicrules

# sudo chmod -R 5775 /etc/snort
# sudo chmod -R 5775 /var/log/snort
# sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
# sudo chown -R snort:snort /etc/snort
# sudo chown -R snort:snort /var/log/snort
# sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules

# sudo touch /etc/snort/rules/white_list.rules
# sudo touch /etc/snort/rules/black_list.rules
# sudo touch /etc/snort/rules/local.rules

# sudo cp ~/snort_src/snort-2.9.16/etc/*.conf* /etc/snort
# sudo cp ~/snort_src/snort-2.9.16/etc/*.map /etc/snort

### Setting network interfaces and routes:

sudo ifconfig enp0s8:0 10.0.0.100
sudo route add -net 172.89.0.0/24 dev enp0s8

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

sysctl net.ipv4.ip_forward

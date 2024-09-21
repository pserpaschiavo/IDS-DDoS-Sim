#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y net-tools

ifconfig enp0s8:0 172.89.0.100
route add -net 10.0.0.0/24 dev enp0s8

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

sysctl net.ipv4.ip_forward

#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y net-tools hping3

sudo route add default gw 172.89.0.100
sudo route add -net 10.0.0.0/24 dev enp0s8

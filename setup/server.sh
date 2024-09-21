#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y net-tools

route add default gw 10.0.0.100
route add -net 11.0.0.0/24 dev enp0s8

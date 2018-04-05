#!/bin/bash

#setup hostapd
hostapd /etc/hostapd.conf &

#config device ip address
ifconfig wlan0 192.168.1.1 netmask 255.255.255.0

#setup dhcp
udhcpd -f /etc/udhcpc.d/udhcpd.conf &

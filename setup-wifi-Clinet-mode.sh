#!/bin/bash

#check command line param
function usage()
{
    echo "Usage:"
    echo "$0 [-s <SSID>] [-p <password>] [-h]"
}

if [ "$#" -lt "1" ];then
    usage
    exit
fi

SSID=""
password=""
while [ $# -gt 0 ]
do
    case $1 in
    -s)
        SSID=$2
        shift 2
    ;;
    -p)
        password=$2
        shift 2
    ;;
    -h)
        usage
    ;;
    esac
done

echo $SSID
echo $password

#wlan restart

#Config WiFi
if [ -e /etc/wifi/client/wifi.conf ]; then
  echo "${password}" | wpa_passphrase "${SSID}" > /etc/wifi/client/wifi.conf
else
  mkdir -p /etc/wifi/client
  touch /etc/wifi/client/wifi.conf
  echo "${password}" | wpa_passphrase "${SSID}" >> /etc/wifi/client/wifi.conf
fi
#Connection WiFi AP
wpa_supplicant -D wext -B -i wlan0 -c /etc/wifi/client/wifi.conf

#Get ip address
udhcpc -b -i wlan0 -R

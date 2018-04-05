#!/bin/bash

parse_json() {
    echo "${1//\"/}" | sed "s/.*$2:\([^,}]*\).*/\1/"
}

s="{\"ssid\":\"JC-GROUP\",\"password\":\"jcgroupsz\!\@\#\",\"mode\":\"client\"}"

echo $s
SSID=$(parse_json $s "ssid")
PW=$(parse_json $s "password")
Mode=$(parse_json $s "mode")

echo $SSID
echo $PW
echo $Mode

if [ "$Mode" == "ap" ];then
    ./setup-wifi-AP-mode.sh
elif [ "$Mode" == "client" ];then
    ./commadLineParam.sh -s $SSID -p $PW
else
    ./setup-wifi-AP-mode.sh
fi

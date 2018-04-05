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
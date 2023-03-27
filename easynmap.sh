#!/usr/bin/sh

echo "Welcome to EasyNmap"
echo "Ctrl-C to stop scan"

echo "Please select UDP ports to scan"
read -p "eg: 22,24,67,4567: " UPORT
UPORT=${UPORT:-21,22,23,53,80,443,500,1701,3389}

echo "Please select TCP ports to scan"
read -p "eg: 22,24,67,4567: " TPORT
TPORT=${TPORT:-21,22,23,53,80,443,500,1701,3389}

echo "Please select target IP"
read -p "eg:10.10.10.1 or 10.0.0.0/24: " TARIP
TARIP=${TARIP:-127.0.0.1}

echo "Please enter sleep time between scans in seconds"
read -p "eg: Time between scans: " SLEEP
SLEEP=${SLEEP:-100}

echo "Do you wish to run once or loop until user break?"
read -p "Enter 1 for loop or 2 to run once: " INPUT

if [ $INPUT -eq 1 ]

then
     while true
     do
     nmap -Pn -sU -p $UPORT -sV -O $TARIP
     sleep $SLEEP
     nmap -Pn -sS -p $TPORT -sV -O $TARIP
     sleep $SLEEP
done

else
     nmap -Pn -sU -p $UPORT -sV -O $TARIP
     sleep $SLEEP
     nmap -Pn -sS -p $TPORT -sV -O $TARIP
break

fi

  GNU nano 5.6.1                                         ip-info.sh                                                   
#!/bin/bash
#
# sort-passwd.sh -- print out essential IP-configuration info
#
# Author: Pieter Deconinck

# get ip interfaces info and remove the first line to not show loopback interface

#variables

ipaddresses=$(ip -brief a | awk 'NR!=1')

echo "???? IP addresses ????"
ip -brief a | awk 'NR!=1'

echo -e "\n???? Default gateway ????"
ip r | awk '{ if($1 == "default") print $3,$4,$5;}'


echo -e "\n???? DNS server(s) ????"

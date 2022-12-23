  GNU nano 5.6.1                                         ip-info.sh                                                   
#!/bin/bash
#
# sort-passwd.sh -- print out essential IP-configuration info
#
# Author: Pieter Deconinck

set -o nounset
set -o errexit

tput setaf 1
echo "???? IP addresses ????"
tput sgr0
ip -brief a


tput setaf 1
echo -e "\n???? Default gateway ????"
tput sgr0
ip route | grep default | awk '{print $3,$4,$5}'

tput setaf 1
echo -e "\n???? DNS servers(s) ????"
tput sgr0
resolvectl dns


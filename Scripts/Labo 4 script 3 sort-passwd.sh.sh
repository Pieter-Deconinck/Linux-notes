  GNU nano 5.6.1                                       sort-passwd.sh                                                 
#!/bin/bash
#
# sort-passwd.sh -- print out /etc/passwd and putting into a table, sortable by colum
#
# Author: Pieter Deconinck

set -o nounset # abort on unbound variable

if [ "${#}" -eq '0' ]; then
  sudo column -t -s ":" /etc/passwd | sort -k 1
elif [ "${1}" -gt '0' ] && [ "${1}" -lt '8' ]; then
  if [ "${1}" -eq '3' ] || [ "${1}" -eq '4' ]; then
     sudo column -t -s ":" /etc/passwd | sort -n -k "${1}"
  else
     sudo column -t -s ":" /etc/passwd | sort -k "${1}"
  fi
else
  echo "Please enter a number between 1 and 7 (included)"
fi


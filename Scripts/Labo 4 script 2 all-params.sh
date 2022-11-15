  GNU nano 5.6.1                                       sort-passwd.sh                                                 
#!/bin/bash
#
# all-params.sh -- print out de meegegeven parameters 1 per 1
#
# Author: Pieter Deconinck

set -o nounset # abort on unbound variable

if [ "${#}" -eq '0'  ]; then
  echo "geen parameters meegegeven!" 
  exit 1
fi


for ITEM in "${@}"; do
  echo ${ITEM}
done




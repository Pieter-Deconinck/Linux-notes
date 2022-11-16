  GNU nano 5.6.1                                           srm.sh                                                     
#!/bin/bash
#
# naam script -- wat het script doet
#
# Author: Pieter Deconinck
#
#
# Default script settings

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

#
# 
# variables
dir=~/.trash


# script

if [ "${#}" -eq '0' ]; then
  echo "Expected at least one argument!"
  exit 1
fi

if [ ! -d "$dir" ]; then
  echo "Created trash folder $dir" 
  mkdir $dir
fi

for ITEM in "${@}"; do
  if [ -f ${ITEM} ]; then
    gzip ${ITEM} 
    mv -v ${ITEM}.gz ${dir}/${ITEM}.gz
  else
    echo "${ITEM} is not a file! Skipping..."
  fi
done


# NOG GEEN UITBREIDING UITGEWERKT
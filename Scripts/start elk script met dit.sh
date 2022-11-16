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
#

if [ "${#}" -eq '0']; then
  echo "Expected at least one argument!"
  exit 1
fi

if [ ! -d "~/.trash"]; then
  echo "Directory doesnt exist"


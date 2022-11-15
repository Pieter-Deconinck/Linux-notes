#!/bin/bash
#
# params.sh --
#
# Author: Pieter Deconinck

echo "Script name: ${0}"
echo "num params: ${#}"
echo "Param 1: ${1}"
echo "Param 3: ${3}"
echo "Param 10: ${10}"

if [ "${#}" -gt '3' ]; then
  shift
  shift
  shift
fi

echo "num params: ${#}" 
echo "Remaining: ${@}"


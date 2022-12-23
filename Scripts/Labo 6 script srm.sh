  GNU nano 5.6.1                                           srm.sh                                                     
#!/bin/bash
#
# 
#
# Author: Pieter Deconinck
#
#
# Default script settings

set -o errexit # abort on nonzero exit status
set -o nounset # abort on unbound variable
set -o pipefail # don't hide errors with pipes

# variables
dir="${HOME}/.trash"

# check if scripts is launched with correct amount of arguments
if [ "${#}" -lt "1" ]; then
  echo "Expected at least one argument!"
  exit 1
fi
 
# check if directory ~/trash exists
# [ is an alias for the test command
if [ -d "${dir}" ]; then
  echo "Trash directory exists"
else
  sudo mkdir "${dir}"
  echo "Created trash folder ${dir}" 
fi

# check for old files in ./trash folder and delete them if they havent been touched since 2 weeks
echo "Cleaning up old files"
for file in "${dir}"/*; do
 if [ -f "$file" ] && ! [ -d "$file" ]; then
    mod_time=$(stat -c %Y "$file")
    current_time=$(date +%s)
    age=$(((current_time - mod_time) / 86400))  # age in days
    if [ $age -gt 14 ]; then
     sudo  rm -v -f "$file"
    fi
  fi
done

# loop through files and gzip and move them. if item is not a file it gets skipped.
for ITEM in "${@}"; do
 if [ -f "${ITEM}" ]; then
   sudo gzip  "${ITEM}"
   sudo mv -v "${ITEM}.gz" "${dir}/${ITEM}.gz"
 else
 echo "${ITEM} is not a file! Skipping..."
 fi
done

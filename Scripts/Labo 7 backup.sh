# WARNING THIS SCRIPT IS UNFINISHED

#! /bin/bash
#
## Usage: ./backup.sh [OPTIONS] [DIR]
##
## DIR
##              The directory to back up
##              Default: the current user's home directory
##
## OPTIONS
##
##  -h, --help
##              Print this help message and exit
##
##  -d, --destination DIR
##              Set the target directory to store the backup file
##              Default:  /tmp

#---------- Shell options ------------------------------------------------------
set -o nounset
set -o errexit
set -o pipefail

#---------- Variables ----------------------------------------------------------

# Time stamp for the backup file
TIMESTAMP="$(date)"

# Path of the directory to back up
source="${1}"


# Directory where to store the backup file
destination="/tmp"


#---------- Main function ------------------------------------------------------
main() {
  process_cli_args "${@}"
  echo "Backup from ${source} to ${destination}"

  check_source_dir
  check_destination_dir

  do_backup
}

#---------- Helper functions ---------------------------------------------------

# Usage: process_cli_args "${@}"
process_cli_args() {
  
  # Use a while loop to process all positional parameters
  count=1
  while [ "${count}" -le "$#" ]; do
   
    # Put the first parameter in a variable with a more descriptive name
    firstparam="${!count}"
    

    # Use case statement to determine what to do with the currently first
    # positional parameter
    case "${firstparam}" in

      # If -h or --help was given, call the usage function and exit
      -h | --help)
        usage
        exit 0
        ;;
      # If -d or --destination was given, set the variable destination to
      # the next positional parameter.
      -d | --destination)
       nextparam="$((count + 1))"
       destination="${!nextparam}"
       ;;
      # If any other option (starting with -) was given, print an error message
      # and exit with an error status
      -*)
       echo "Unkown option: ${!count}"
       exit 1
       ;;
      # In all other cases, we assume the directory to back up was given.
      *)
       source="${firstparam}"
       ;;

      esac
    count="$((count + 1))"
  done
      
      
}

# Usage: do_backup
#  Perform the actual backup
do_backup() {
  local source_dirname backup_file
  # Get the directory name from the source directory path name
  # e.g. /home/osboxes -> osboxes, /home/osboxes/Downloads/ -> Downloads
  # Remark that this should work whether there is a trailing `/` or not!
  source_dirname=
  
  # Name of the backup file
  backup_file=

  # Create the bzipped tar-archive on the specified destination
  
}

# Usage: check_source_dir
#   Check if the source directory exists (and is a directory). Exit with error
#   status if not.
check_source_dir() {
  :
}

# Usage: check_destination_dir
#   Dito for the destination directory
check_destination_dir() {
  :
}

# Print usage message on stdout by parsing start of script comments.
# - Search the current script for lines starting with `##`
# - Remove the comment symbols (`##` or `## `)
usage() {
  :
}

main "${@}"
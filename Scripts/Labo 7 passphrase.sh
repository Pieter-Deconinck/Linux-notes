#! /bin/bash
#
## Usage: ./passphrase.sh [N] [WORDLIST]
##        ./passphrase.sh -h|--help
##
## Generate a passphrase, as suggested by http://xkcd.com/936/
##
##   N
##            The number of words the passphrase should consist of
##            Default: 4
##   WORDLIST
##            A text file containing words, one on each line
##            Default: /usr/share/dict/words
##
## OPTIONS
##   -h, --help
##              Print this help message
##
## EXAMPLES
##
##   $ ./passphrase.sh -h
##   ...
##   $ ./passphrase.sh
##   unscandalous syagush merest lockout
##   $ ./passphrase.sh /usr/share/hunspell/nl_BE.dic 3
##   tegengif/Ze Boevink/PN smekken 

#---------- Shell options -----------------------------------------

 set -o nounset
 set -o errexit

#---------- Variables ---------------------------------------------

aantal_woorden="${1:-4}" 
woordenlijst="${2:-/usr/share/dict/words}"


#---------- Main function -----------------------------------------
main() {
  process_cli_args "${@}"
  generate_passphrase
}

#---------- Helper functions --------------------------------------

# Usage: generate_passphrase
# Generates a passphrase with ${num_words} words from ${word_list}
generate_passphrase() {
  
  shuf -n "${aantal_woorden}" "${woordenlijst}" | paste -sd ' '

}

# Usage: process_cli_args "${@}"
#
# Iterate over command line arguments and process them
process_cli_args() {

  # If the number of arguments is greater than 2: print the usage
  # message and exit with an error code
  if [ "${#}" -gt "2" ]; then
    echo "At most 2 arguments expected, got ${#}"
    usage
    exit 1
  fi

  # Loop over all arguments
  for item in "${@}"; do
     # Use a case statement to determine what to do
     case "$item" in
        # If -h or --help was given, call usage function and exit
        -h|--help)
          usage
          exit 1
          ;;
        # If any other option was given, print an error message and exit
        # with status 1
        -*)
          echo "Unkown option: ${item}"
          usage
          exit 1
          ;;
        # In all other cases, we assume N or WORD_LIST was given
        *)
           # If the argument is a file, we're setting the word_list variable
          if [ -f "${item}" ]; then
          woordenlijst="${item}"
          # If not, we assume it's a number and we set the num_words variable
          else
          aantal_woorden="${item}"
          fi
          ;;
     esac
  done
}

# Print usage message on stdout by parsing start of script comments.
# - Search the current script for lines starting with `##`
# - Remove the comment symbols (`##` or `## `)
usage() {
  
  grep "^##" passphrase.sh | cut -c 3-

}

# Call the main function
main "${@}"



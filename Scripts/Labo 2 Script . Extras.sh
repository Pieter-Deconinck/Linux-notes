#! /bin/bash

set -o nounset
set -o errexit

# variables
csv_file_location="/home/osboxes/Scripts/employees.csv"
csv_file_dir="/home/osboxes/Scripts"
num_employees=$(wc -l < ${csv_file_location})


echo "Generating Password and outputting them to ${csv_file_dir}/passwords.txt"
sudo apg -n ${num_employees} -m 15 -a 1 -M NCL > ${csv_file_dir}/passwords.txt

echo "Generating Usernames and outputting them to ${csv_file_dir}/usernames.txt"
sudo awk -F, '{print $4, $5}' ${csv_file_location} | awk '{print tolower($1) tolower(substr($2,1,1)) tolower(substr($3,1,1))}' | awk 'NR>1'| iconv -t ASCII//TRANSLIT > ${csv_file_dir}/usernames.>

echo "Pasting Passwords and usernames together and outputting them to ${csv_file_dir}/user-pass.csv"
sudo paste -d, ${csv_file_dir}/passwords.txt ${csv_file_dir}/usernames.txt > ${csv_file_dir}/user-pass.csv

echo "Deleting temporary files passwords.txt and usernames.txt"
sudo rm ${csv_file_dir}/passwords.txt
sudo rm ${csv_file_dir}/usernames.txt


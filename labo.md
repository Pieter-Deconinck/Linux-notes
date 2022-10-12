apt list --installed | less

apt list --installed > packages.txt

apt list --installed > packages.txt 2> /dev/null

head packages.txt | awk '(NR>1)'

wc -l packages.txt

6 = ?

less packages.txt | grep python | wc -l
het zijn er 98

apt list search *python*  ?
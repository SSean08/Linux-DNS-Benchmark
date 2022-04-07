#!/bin/bash

if [[ $1 -eq "-h" ]];
then
	echo "dns-test.sh DNSServer hostname queries"
	echo "ex. ./dns-test.sh 8.8.8.8 facebook.com 100"
else




num=0
queries=$3
for i in $(seq $3);
do
	temp=$( dig @$1 $2 | awk '/Query time:/ { print $4}' )
	echo Query: $i
	echo Query "(msec): "$temp
	num=$(( $num + $temp))
        echo New Total: $num;
done
echo Average "(Total time ($num)/Queries ($queries))": $(($num / $queries))

fi

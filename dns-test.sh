#!/bin/bash

if [[ $1 = "-h" ]];
then
	echo "dns-test.sh dns-server domain-name requests"
	echo "Example: ./dns-test.sh 8.8.8.8 facebook.com 100"
else

total=0
queries=$3
for i in $(seq $3);
do
	temp=$( dig @$1 $2 | awk '/Query time:/ { print $4}' )
	echo Query: $i
	echo Query "(msec): "$temp
	total=$(( $total + $temp))
        echo New Total: $total;
done
echo Average "(Total time ($total) / Queries ($queries))": $(($total / $queries))

fi

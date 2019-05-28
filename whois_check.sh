#!/bin/bash

domain=$1
while read sub;do
	curl -s "https://www.whois.com/whois/$sub" | awk 'BEGIN{FS="Organization"} {print $2}' | grep "$sub" -i | awk 'BEGIN{FS="</div>"} {print $2}' | awk 'BEGIN{FS=">"} {print $2}';
	echo $sub;
done


#!/bin/bash

function strip_html(){
	grep -oP '(?<=<span class="no-wrap" data-price-btc).*?(?=</span>)' $output >temp.txt 

	sed -i 's/[^>]*>//g' temp.txt >$output
	sed -ni '1p' temp.txt >$output
	cp temp.txt $output
	rm temp.txt
}
function print(){
	while read price
	do  
	val=$price
	done <$output
	echo "$val" 
}
coin=$1
url='https://www.coingecko.com/en/coins/'$coin''
output=price.txt
touch $output temp.txt
curl -o $output $url 
strip_html  
print
rm price.txt

#!/bin/bash
currect_dir=$(pwd)
domains_filename="$(pwd)/domains.txt"
lines=`cat $domains_filename`

#echo $domains_filename
# вводится домен - если он есть в файле то скрипт показывает кол-во оставшихся дней валидности серта
SERVER=$1


IFS=$'\n' read -d '' -r -a lines < $domains_filename

printf "line 1: %s\n" "${lines[0]}"
printf "line 2: %s\n" "${lines[1]}"

# all lines
echo "${lines[@]}"

for line in ${lines[@]}; do
	if [ $SERVER == $line ]
	then
		echo -e "\n--------------------------------------------------\n"  $SERVER -- $line "\n--------------------------------------------------\n"
		PORT=${2:-443}
		TIMEOUT=25
		end_date="$(/usr/bin/timeout $TIMEOUT /usr/bin/openssl s_client -host $SERVER -port $PORT -showcerts < /dev/null 2>/dev/null | sed -n '/BEGIN CERTIFICATE/,/END CERT/p' | openssl x509 -enddate -noout 2>/dev/null | sed -e 's/^.*\=//')"

		if [ -n "$end_date" ]
		then
			end_date_seconds=$(date "+%s" --date "$end_date")
			now_seconds=$(date "+%s")
			CALC=$((($end_date_seconds-$now_seconds)/24/3600))
			echo -e $CALC "\n--------------------------------------------------\n"
			echo "Cert of domain " $SERVER " will be expired in -- " $CALC " days"
			echo -e "\n--------------------------------------------------\n"
			exit 0
		else
			exit 124

		fi
	fi
done

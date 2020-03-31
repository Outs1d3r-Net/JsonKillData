#!/bin/bash

####################################################################################
# This script create a database with metadata information extracted with exiftool  #
# and then treats the data for a more friendly output in json format.              #
####################################################################################


#Variables
list=$(ls)

#FunctionsFrist, install exiftool with:
filds(){
	echo -e "Filds: \n";
	cat output.json | cut -d ":" -f1| tr -d '{},[]"' | sort | uniq |tr -d "\n";echo -e "\n\n";
}

instru(){
	echo -e "\n[*] Instructions [*]\n\nfilds = List data filds in output.json\nclear = Clear screen\nquit = Quit program\n"
}

#Main
if [[ $list  !=  *"output.json"* ]];then
	exiftool -all * -j >> output.json;

else
	echo "Output file present..."
	sleep 2
fi
clear
while true; do
	echo 'Press "i" for instructions.'
	read -p ">>> " i
	if [ "$i" == "clear" ];then
		clear
	elif [ "$i" == "i" ];then
		instru
	elif [ "$i" == "quit" ];then
		exit 0;
	elif [ "$i" == "filds" ];then
		filds
	else
		echo "----------------------------------------------------------------"
		less output.json | grep $i| sort | uniq|nl;echo
		echo "----------------------------------------------------------------"
	fi
done

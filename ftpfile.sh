#!/bin/bash

#pars user option
#using a loop to pick up flags like -a or -w (flaps)
#loop and when when it finds a certain flag then it stores that

usage(){
	echo "Invalid options"
	echo "Usage ./$0 -f<file.zip> [-u<username>] [-p<passwd>]"
	echo "-f is the zipped file to ftp."
	exit 1
}

#check for help arg
host="137.190.19.97"
if [[ $1 == "--help" ]]
then
	usage
fi



#looping for flags/ options -s -w -c
while getopts ":f:u:p:" opt #once it finds it, it is stored in opt
do 
	case $opt in 
		f) file=$OPTARG 
        		;;
		u) uName=$OPTARG
			;;
		p) pass=$OPTARG
			;;
		\?)#anything else is invalid option
			usage
			;;
	esac


done

if [[ -z $file ]] #check if size is empty
then
	echo "File argument is required."
	usage
fi

if [[ -z $uName && -z $pass ]]
then
	echo "anon log in"
else
	ftpCall=`ftp -n $host <<END_SCRIPT
	quote USER $uName
	quote PASS $pass
	put $file
	quit
	END_SCRIPT`
fi

if [[ $? -eq 1 ]]
then
	echo "ftp failed"
	exit 1
fi


echo "[$file] [$uName] [$pass]"

exit 0

#!/bin/bash

#pars user option
#using a loop to pick up flags like -a or -w (flaps)
#loop and when when it finds a certain flag then it stores that

usage(){
	echo "Invalid options"
	echo "Usage $0 -f<file.zip> [-u<username>] [-p<passwd>]"
	echo "-f is the zipped file to ftp."
	exit 1
}

#Variables For anonymous log in
#Note: for both log in there needs to be separate sets of log in creds
#anonymous log in vars only change host
anonHost=""  #<----------add your host IP here
regHost=""  #<----------add your host IP here
aName="anonymous"
aPass=""
dir="MockData"
log=./ftplog.log #log file to capture ftp status code


if [[ $1 == "--help" ]]
then
	usage
fi

#get opts portion
while getopts ":f:u:p:" opt 
do 
	case $opt in 
		f) file=$OPTARG 
        		;;
		u) uName=$OPTARG
			;;
		p) pass=$OPTARG
			;;
		\?)
			usage
			;;
	esac


done

if [[ -z $file ]] #check dir is empty
then
	echo "File argument is required."
	usage
fi

if [[ -z $uName || -z $pass ]]
then
	echo "anon log in"
	
	ftp -nv $anonHost <<END_SCRIPT > $log
	quote USER $aName
	quote PASS $aPass
	cd $dir
	put $file
	quit
END_SCRIPT
	
else
	echo "regular log in"
	
	ftp -nv $regHost <<END_SCRIPT > $log
	quote USER $uName
	quote PASS $pass
	put $file
	quit
END_SCRIPT
fi
grep "226 Transfer complete" $log
if [[ $? -eq 1 ]]
then
	echo "ftp failed"
	exit 1
else
	echo "ftp worked"
fi
#echo "Parameters"
#echo "[$file] [$uName] [$pass]"

exit 0

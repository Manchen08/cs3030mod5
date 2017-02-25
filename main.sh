#!/bin/bash - 
#===============================================================================
#
#          FILE: main.sh
# 
#         USAGE: ./main.sh -y year -e email (o)-u user (o)-p password
# 
#   DESCRIPTION: Main wrapper for homework 4
# 
#         NOTES: ---
#        AUTHOR: Jon Wheeler (), jonathanwheeler1@weber.edu
#       CREATED: 02/14/2017 21:16
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

help()
{
	echo "Usage $0 -y YEAR -e EMAIL (o)-u USER (o)-p PASSWD"
	exit 1;
}
if [[ $1 == "--help" ]]
then
	help
fi

while getopts ":y:e:u:p:" opt
do
	case $opt in
		y) year=$OPTARG
			;;
		e) email=$OPTARG
			;;
		u) user=$OPTARG
			;;
		p) passwd=$OPTARG
			;;
		/?)
			help
			;;
	esac
done

if [[ -z $year ]]
then
	echo "Require Year"
	help
fi

if [[ -z $email ]]
then
	echo "Require email"
	help
fi

bash getfiles.sh $year

# check proper exit from pulling files
if [[ $? == 1 ]]
then
	echo "Error in pulling files"
	exit 1
fi


bash expandfiles.sh
# run expandfiles script

if [[ $? == 1 ]]
then
	echo "Error in expanding files"
	exit 1
fi

# call filterscript Currently being done in expandfiles
#if [[ $? == 1 ]]
#then
#	echo "Error in filtering data"
#	exit 1
#fi

bash compressfiles.sh "FilteredData.txt"
# run compress
if [[ $? == 1 ]]
then
	echo "Error in Compression"
	exit 1
fi

ts=`date +%Y_%m_%d_%H:%M`
fileName="MOCK_DATA_FILTER_$ts.zip"

# run FTP script
bash ftpfile.sh -f "$fileName" -u $user -p $passwd

if [[ $? == 1 ]]
then
	echo "FTP Error"
	exit 1
fi

# run clean script
bash cleanfiles.sh
if [[ $? == 1 ]]
then
	echo "Error in cleaning temp files."
	exit 1
fi

echo "Succesfully transfered files to 137.190.19.104" | mail -s "Successful Transfer " $email echo "Process finished"


exit 0


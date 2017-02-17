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
	echo "Usage ./$0 -y YEAR -e EMAIL (o)-u USER (o)-p PASSWD"
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

if [[ $year != '2015' ]] && [[ $year != '2016' ]]
then
	echo "Year must be 2015 or 2016"
	exit 1
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



# run expandfiles script

if [[ $? == 1 ]]
then
	echo "Error in expanding files"
	exit 1
fi

# call filterscript
if [[ $? == 1 ]]
then
	echo "Error in filtering data"
	exit 1
fi

# run FTP script
if [[ ! -z $user ]] && [[ ! -z $passwd ]]
then 
	echo "Pulling files with $user"
else
	echo "Pulling files with anonymous"
fi

if [[ $? == 1 ]]
then
	echo "Error in FTP Script"
	exit 1
fi


# run clean script
if [[ $? == 1 ]]
then
	echo "Error in cleaning temp files."
	exit 1
fi

echo "Process finished"


exit 0


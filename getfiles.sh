#!/bin/bash - 
#===============================================================================
#
#          FILE: getfiles.sh
# 
#         USAGE: ./getfiles.sh 
# 
#   DESCRIPTION: 
# 
#         NOTES: ---
#        AUTHOR: Jon Wheeler (), jonathanwheeler1@weber.edu
#       CREATED: 02/16/2017 15:20
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
#reg='MOCK_DATA_[0-9]{4}\.tar\.gz'

if [[ -z $1 ]]
then
	echo "No year provided"
	exit 1
else
	year=$1
fi

if [[ $year != '2015' ]] && [[ $year != '2016' ]]
then
	echo "Year must be 2015 or 2016"
	exit 1
fi

wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz

# Check success
if [[ $? == '1' ]]
then
	exit 1
fi

if [[ $year -eq '2015' ]]
then
	echo "Year is now 2016"
	year='2016'
else
	echo "Year is now 2015"
	year='2015'
fi

wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz

#wget -A -r -p --accept-regex=$reg icarus.cs.weber.edu/~hvalle/cs3030/
#wget -A "MOCK_DATA_*" icarus.cs.weber.edu/~hvalle/cs3030

# Check success
if [[ $? == '1' ]]
then
	exit 1
fi

exit 0


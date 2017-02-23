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
reg='MOCK_DATA_[0-9]{4}\.tar\.gz'

if [[ -z $1 ]]
then
	echo "No year provided"
	exit 1
fi

if [[ $1 != '2015' ]] && [[ $1 != '2016' ]]
then
	echo "Year must be 2015 or 2016"
	exit 1
fi

wget -r -p --accept-regex=$reg icarus.cs.weber.edu/~hvalle/cs3030/

if [[ $? == '1' ]]
then
	exit 1
fi

exit 0


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

if [[ -z $1 ]]
then
	echo "No year provided"
	exit 1
fi

echo "Getting file with year $1"

wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$1.tar.gz

if [[ $? == '1' ]]
then
	exit 1
fi

exit 0


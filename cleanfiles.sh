#!/bin/bash

rm MOCK_DATA*
rm -rf temp
rm FilteredData.txt

if [[ $? == 1 ]]
then
	exit 1
fi

exit 0

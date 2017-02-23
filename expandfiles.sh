#!/bin/bash
#Chris Langan

#This program will take the tar files that were retrieved in a previous script
#It expects those files to be in the current directory with the rest of the scripts
#Expand them into a temporary folder
#Call filterdata.awk for each csv
#Captures the output of awk, stores it in FilteredData.txt
#FilteredData.txt is stored in the main directory of the scripts

echo "Making temp directory..."
mkdir temp

echo "Expanding tar balls..."
tar xf ./MOCK_DATA_2016.tar.gz -C ./temp
tar xf ./MOCK_DATA_2015.tar.gz -C ./temp

cd temp

echo "Beginning filtering process..."
for i in 1 2 3 4 5 6 7 8 9 "10"
do
	cat MOCK_DATA$i.csv | ../filterdata.awk >> ../FilteredData.txt
done

echo "Done. Filtered output can be found in FilteredData.txt"


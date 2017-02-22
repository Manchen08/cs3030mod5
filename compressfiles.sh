#this script takes an input file as a parameter. 
#It then zips the file and stores it in the $PWD

ts=`date +%Y_%m_%d_%H:%M`
fileName="MOCK_DATA_FILTER_$ts"
if [[ -z $1 ]]
then
	echo"file was not entered"
	exit 1
else

    echo "File Name: $1"
	file=$1
	zipCall=`zip -v $fileName $file`

	if [[ $? -eq 1 ]]
	then
		echo "zip failed"
		exit 1
	else
		echo "zip worked"
	fi
fi



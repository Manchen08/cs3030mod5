# cs3030mod5

main.sh
Usage ./main.sh -y YEAR -e EMAIL (o) -u USER (o)-p PASSWD

Pass in the year to retrieve the document at the required year. Pass in the email that you want the success notification to be sent to. Pass in the optional user and password if the FTP target requires authentication. 

getfiles.sh $1
Requires a year to be passed into it to properly pull the data. This script will pull both files. 

expandfiles.sh
This script creats the temp folder, and expands the two files to be filtered.

filterdata.awk 
Holds the process for filtering the data.

compressfiles.sh $1
Requires the file name to be zipped. This script will then compress the filtered data.

ftpfile.sh -f FILENAME [-u USERNAME] [-p PASSWD]
Requires the destination IP to be added to the script. Also requires the filename to be sent. If the optional user name and password are sent, it will attempt to connect to the host with those credintials. If either of them are null, it will use anonymous. 

cleanfiles.sh
Written to clean files up the temporary files. 

#!/usr/bin/awk -f

BEGIN { FS=",";}
{
	if ($5 == "Female")
	{
		if ($6 == "Canada")
		{
			if ($4 == "")
			{
				print $2 "," $3 ",waldo@weber.edu";
			}
			else
			{
				print $2 "," $3 "," $4;
			}
		}
	}
}
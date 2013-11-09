export PATH=/bin:/sbin:/usr/bin:/usr/sbin;
cat /tmp/scan.txt | grep Cell | awk '{print $5;}' | sort | awk '
BEGIN {
	mac = "";
	macold = "";
	totalmac = 0;
	}
{
	mac = $1;

	if (macold != mac)
	{
		printf ( mac",") > "/tmp/cell_macs.txt" ;
		macold = mac;
		totalmac = totalmac + 1;
	}
}
END {
	}
'

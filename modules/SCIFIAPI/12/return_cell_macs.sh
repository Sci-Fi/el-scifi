export PATH=/bin:/sbin:/usr/bin:/usr/sbin;
logger 'SCIFI - getting number of neighboring cells'	
n=$(grep -o , /tmp/cell_macs.txt | wc -l)
cat /tmp/cell_macs.txt
exit $n

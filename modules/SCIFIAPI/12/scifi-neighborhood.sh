#!/bin/sh                           
# version 20131017
# Return the neighborhood of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

logger 'SCIFI - getting number of neighboring cells'
NEIGH=`cat /tmp/cell_macs.txt 2>/dev/null`
n=$(grep -o , /tmp/cell_macs.txt | wc -l)
echo $NEIGH
exit $n
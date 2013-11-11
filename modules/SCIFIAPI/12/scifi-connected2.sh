#!/bin/sh                           
# version 20131017
# Return the father of device and if there is a 'child' in this device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

FATHER=`cat /etc/scifi/scifi-connected2.txt 2>/dev/null`

#Must test if there is a lan swith port in use

echo $FATHER
exit `cat /sys/class/net/eth0/carrier`
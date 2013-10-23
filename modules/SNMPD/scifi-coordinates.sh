#!/bin/sh                           
# versão 20131017
# Return the coordinates of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

COOR=`cat /etc/scifi/scifi-coordinates.txt`

echo $COOR
exit 0
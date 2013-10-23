#!/bin/sh                           
# versão 20131017
# Return the neighborhood of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

NEIGH=`cat /etc/scifi/scifi-neighborhood.txt`

echo $NEIGH
exit 0
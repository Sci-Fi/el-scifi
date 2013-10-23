#!/bin/sh                           
# versão 20131017
# Return the father of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

#FATHER=''
FATHER=`cat /etc/scifi/scifi-connected2.txt`

echo $FATHER
exit 0
#!/bin/sh                           
# versão 20131017
# Return the father of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

FATHER=`cat /etc/scifi/scifi-connected2.txt`

#Must test if there is a lan swith port in use

echo $FATHER
exit 0
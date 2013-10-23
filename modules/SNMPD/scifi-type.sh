#!/bin/sh                           
# versão 20131017
# Return the typu of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

TYPE=`cat /etc/scifi/scifi-TYPE.txt`

echo $TYPE
exit 0
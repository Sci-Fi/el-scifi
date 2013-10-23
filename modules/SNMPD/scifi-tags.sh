#!/bin/sh                           
# versão 20131017
# Return the Tags of device
# Cosme Corrêa
# cosmefc@id.uff.br
# uncomment for debug
#set -xv

TAGS=`cat /etc/scifi/scifi-subversion.txt`

echo $TAGS
exit 0
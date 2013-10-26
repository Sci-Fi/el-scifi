#!/bin/bash
# Easy Life SCIFI
#
# Configuration Tool for an Easy Life
# Version 20130918
#
# SNMPD module
#
# Cosme Faria Corrêa
# John Doe
# ...
#
#set -xv        

clear


cat <<-EOF
  =========================================
  |           Easy Life for SCIFI         |
  =========================================
                  SNMPD Module

  This module will:
  1) Install SNMPD
  2) Copy Template
  3) Setup SNMPD
  4) Star processes
  5) Scripts
  6) Some subs

  Press <Enter> key
  
EOF
read

#1 
yum install net-snmp net-snmp-utils snmpcheck -y

#2 
mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.`date +%Y%m%d-%H%M%S`
cp -p $ModDir/SNMPD/snmpd.conf /etc/snmp/

#3 Subs
sed -i s/LDAPPRIMARYDISPLAYNAME/"$LDAPPRIMARYDISPLAYNAME"/g /etc/snmp/snmpd.conf
sed -i s/LDAPPRIMARYUIDMAIL/$LDAPPRIMARYUIDMAIL/g /etc/snmp/snmpd.conf
sed -i s/MACHINE/$MACHINE/g /etc/snmp/snmpd.conf
sed -i s/SYSLOCATION/"$SYSLOCATION"/g /etc/snmp/snmpd.conf

#4 Star processes
chkconfig snmpd on
service snmpd start

#5 Scripts
cp -f  $ModDir/SNMPD/*.sh $SCRIPTDIR
ln -s $SCRIPTDIR/*.sh /usr/bin/

#6 Some subs
echo $IGNAME > /etc/scifi/scifi-connected2.txt
echo CONTROLLER > /etc/scifi/scifi-type.txt
echo $IGNAME > /etc/scifi/scifi-neighborhood.txt


echo SNMPD module finished
echo 'Press <Enter> to exit'
read

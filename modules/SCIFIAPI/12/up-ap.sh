#!/bin/sh                           
# version 20131104
# Update API in APs
# Cosme Corrêa - cosmefc@id.uff.br
# uncomment for debug
#set -xv

ERRO () {
echo $1
echo 
echo 'Update APs API'
echo 
echo sintax:   $0  
echo 
echo example:   $0 
echo 
exit 1
}

if [ "`/usr/share/scifi/scripts/scifi-type.sh`" = "CONTROLLER" ]
	then
#	Test # of parameters
	[ "$#" != "1" ] && ERRO "Error, wrong # of parameters"
#	copy pacakge to ap
	scp -pri /etc/scifi/controller_key /etc/scifi/SCIFIAPI/current root@$1:/tmp/SCIAPI
#	execute it remotely
	ssh -i /etc/scifi/controller_key  root@$1 '/tmp/SCIFIAPI/up-ap.sh'
	else
#	Test # of parameters
	[ "$#" != "0" ] && ERRO "Error, wrong # of parameters"
#	get informations
	SYSLOCATION=`snmpget -v 1 -c public 127.0.0.1 sysLocation.0 | cut -d" " -f4-`
	SYSNAME=`snmpget -v 1 -c public 127.0.0.1 sysName.0 | cut -d" " -f4-`
	SYSCONTACT=`snmpget -v 1 -c public 127.0.0.1 sysContact.0 | cut -d" " -f4-`
#	preserve old directory
	mv /usr/share/scifi/scripts/ /usr/share/scifi/scripts/.`date +%Y%m%d-%H%M%S` 2>/dev/null
	mkdir /usr/share/scifi/scripts/
#	copy scripts
	copy -f /tmp/SCIFIAPI/*.sh /usr/share/scifi/scripts/
#	copy conf files
	copy -f /tmp/SCIFIAPI/scifi-version.txt /etc/scifi/
	copy -f /tmp/SCIFIAPI/scifi-subversion.txt /etc/scifi/
	chmod 700 /usr/share/scifi/scripts/ -R
#	snmp setup
	mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.`date +%Y%m%d-%H%M%S` 2>/dev/null
	mv /tmp/SCIFIAPI/snmpd.conf /etc/snmp/
#	some subs
	sed -i s/SYSLOCATION/$SYSLOCATION/g /etc/snmp/snmpd.conf
	sed -i s/SYSNAME/$SYSNAME/g /etc/snmp/snmpd.conf
	sed -i s/SYSCONTACT/$SYSCONTACT/g /etc/snmp/snmpd.conf
#	restart snmpd
	/etc/init.d/snmpd stop
	/etc/init.d/snmpd start
#	legacy
#	if exist a directory /etc/scripts
#	  preserv
#	  create a link to /usr/share/scifi/scripts
#	fi
	if [ ! -L "/etc/scripts" ]; then
	    mv /etc/scripts /etc/scripts.`date +%Y%m%d-%H%M%S` 2>/dev/null
	    ln -s /usr/share/scifi/scripts /etc/scripts
	fi
fi
exit 

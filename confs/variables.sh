#!/bin/bash
# SCIFI
DIRELSCIFI=/usr/share/el-scifi/ # Where ELSCIFI stay
ModDir=$DIRELSCIFI'modules/' # Where are modules
SCRIPTDIR=/usr/share/scifi/scripts/ # Where are scripts
# SELinux
SELPOL=permissive # enforcing | permissive | disabled
# Network
MACHINE=scifi # Machine name 
DOMAIN=uff.br # Domain name 
DOMAINWIFI=wifi.uff.br # Wifi Domain name
FQDN=$MACHINE'.'$DOMAIN # Machine name + . + Domain name
EXTIP=192.168.122.229 # External IP
EXTMASK=255.255.255.0 # External IP MASK
EXTINT=eth0 # External Interface
INTINT=eth1 # Internal Interface
IGNAME=InternetGateway # Internet gateway name
IGIP=192.168.122.1 # Internet gateway IP
# SNMPD
SYSLOCATION='Data Center'
# LDAP
LDAPSERVER=127.0.0.1 # LDAP server
#LDAPSERVER=ldap://127.0.0.1,ldap://200.200.200.200 # LDAP server
LDAPSUFIX='dc=uff,dc=br' # LDAP sufix
LDAPADMPASSWD=Batata # LDAP Administrator password
LDAPPRIMARYUID=cosmefc # LDAP UID
LDAPPRIMARYDISPLAYNAME='COSME FARIA CORREA' # LDAP CN. Must have two words at least
LDAPPRIMARYCN=`echo $LDAPPRIMARYDISPLAYNAME | cut -d' ' -f1`
L=`echo $LDAPPRIMARYDISPLAYNAME | wc -w`
LDAPPRIMARYSN=`echo $LDAPPRIMARYDISPLAYNAME | cut -d' ' -f$L` 
LDAPPRIMARYPASSWD=Beringela # LDAP primary user password
LDAPPRIMARYUIDMAIL=$LDAPPRIMARYUID'@'$DOMAIN
# Samba
SAMBASID=S-1-5-21-1014769180-777746548-3660226278 # Samba SID
SAMBADOMAIN=WIFI # Samba Domain Name
# MRTG
MRTGAUTH=n # MRTG authenticated - If you have to authenticate to see (y)es, (n)o or (g) you must belong a group
MRTGGROUP=NetAdmins # MRTG authenticated group
# NAGIOS
NAGIOSAUTH=g # NAGIOS authenticated - If you have to authenticate to see (y)es or (g) you must belong a group
NAGIOSGROUP=NetAdmins # NAGIOS authenticated group
# Monitorix
MONITORIXAUTH=y # MONITORIX authenticated - If you have to authenticate to see (y)es, (n)o or (g) you must belong a group
MONITORIXGROUP=NetAdmins # MONITORIX authenticated group
# Radius
RADIUSSERVER=127.0.0.1 # Radius server
RADIUSDOMAIN=uff.br # Radius domain
RADIUSACCOUNT='reader-radius' # Radius account - without use nowadays
RADIUSACCPASS=Aspargos # Radius account password
RADIUSPASS=Taioba # Radius password
# Shibboleth
SHIBPASS=BeterrabaDoce # Shib password
# LOG
DURATION=104 # Weeks to retain logs
# SSH
SSHDAUTH=g # SSHD authenticated - If you have right to use (u)sers or (g)roup you must belong a group
SSHDGROUP=NetAdmins # SSHD authenticated group
SSHDUSERS='cosmefc johndoe' # users list with ssh right
# Denyhosts
LOCKTIME=4h # Deny Hosts lock time
# Postfix
RELAYHOST=mxrelay.uff.br
RELAYACC=manezinho
RELAYPASSWD=segredo


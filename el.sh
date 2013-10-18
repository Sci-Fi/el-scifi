#!/bin/bash
# Easy Life SCIFI
#
# Configuration Tool for an Easy Life
# Version 20130819
#
# Cosme Faria Corrêa
# John Doe
# ...
#
# set -xv

# Start Variables
CurDir='/usr/share/el-scifi'
#ModDir=$CurDir'/modules/'
CFGFile=$CurDir'/confs/variables.sh'
Start=`date +%Y%m%d-%H%M%S`
Steps='Install Variables SELinux Network SNMPD Logs LDAP Apache Monitorix DNSMasq MRTG Nagios RADIUS Firewall SSHD DenyHosts NTPD Postfix JBossAS ProgreSQL SCIFIWeb SCIFIKernel Exit' 
while true ; do
  clear
  . $CFGFile
  cat <<-EOF
  =========================================
  |           Easy Life for SCIFI         |
  =========================================


  Steps, you must config:

EOF
  select Step in $Steps; do            
    break                                 
  done
  case "$Step" in
    Exit)
      exit
      ;;
    *)
      . $ModDir$Step.sh
      ;;
   esac
done

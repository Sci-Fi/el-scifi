#!/bin/bash
# Easy Life SCIFI
#
# Configuration Tool for an Easy Life
# Version 20130819
#
# Install module
#
# Cosme Faria Corrêa
# John Doe
# ...
#
# set -xv        

clear
cat <<-EOF
  =========================================
  |           Easy Life for SCIFI         |
  =========================================
                  Install Module

  This module will install:
  1) EPEL
  2) Some utilities

  Press <Enter> key

EOF
read

# EPEL
echo Installing EPEL
yum localinstall "$ModDir"Install/epel-release-6-8.noarch.rpm -y --nogpgcheck

# Utilities
echo Installing Utilities
yum install screen vim htop tree coreutils yumex setuptool authconfig glibc-common openssl unzip java-1.7.0-openjdk-devel -y

#
mkdir -p $SCRIPTDIR

echo Install module finished
echo 'Press <Enter> to exit'
read

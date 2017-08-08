#!/bin/bash
##############################################################################
# Server model/version/serial identification script
# Ver 0.1.2 2011-11
# Created by yuriy@novostavskiy.kiev.ua
#
# Script is licensed under the GNU General Public License, version 2
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
##############################################################################
 
if [ -a /usr/sbin/dmidecode ]
  then
 
        echo "BIOS vendor  : " `dmidecode -s  bios-vendor` " BIOS vesion: " `dmidecode -s  bios-version` " release date: " `dmidecode -s  bios-release-date`
        echo "Manufacturer : " `dmidecode -s system-manufacturer`
echo "Server Model : " `dmidecode -s system-product-name` "version: " `dmidecode -s system-version`
        echo "Serial No.   : " `dmidecode -s system-serial-number`
echo "System UUID  : " `dmidecode -s system-uuid`
        #dmidecode -s baseboard-manufacturer
        #dmidecode -s baseboard-product-name
        #dmidecode -s  baseboard-version
        echo "Board S/N    : " `dmidecode -s baseboard-serial-number`
        echo "Board Asset  : " `dmidecode -s baseboard-asset-tag`
        #dmidecode -s chassis-manufacturer
        #dmidecode -s chassis-version
        echo "Chassis Type : " `dmidecode -s chassis-type`
        echo "Chassis S/N  : " `dmidecode -s chassis-serial-number`
        echo "Chassis Asset: " `dmidecode -s chassis-asset-tag`
        #dmidecode -s processor-manufacturer
        echo "CPU(s) family: " `dmidecode -s processor-family` " CPU(s) freq.: " `dmidecode -s processor-frequency`
fi
 
echo "CPU(s) cores : " `cat /proc/cpuinfo |grep -c processor`
echo "CPU(s) model : " ` cat /proc/cpuinfo |grep -m 1 "model name" |cut -c 13-79 `
echo "RAM size     : " `free -t -m | grep Mem |cut  -c 12-19` "Megabytes"
#i####Identify Lan0/eth0 IP and MAC################################
echo "IP address   : " ` ifconfig | grep '\<inet\>' | sed -n '1p' |tr -s ' ' | cut -d ' ' -f3 | cut -d ':' -f2`
echo "MAC address  : " `ifconfig  eth0 | grep 'Ether' | tr -s ' '   | cut -d ' ' -f5 |  sed 's/://g'`
echo "default GW : " `  netstat -rn |grep '0.0.0.0' |awk {'print $2'} |grep -v '0.0.0.0'`
######Identify Linux verion/release###############################
######Identify Linux verion/release###############################
if [ -a /etc/SuSE-release ]
  then cat /etc/SuSE-release
fi
if [ -a /etc/issue ]
  then cat /etc/issue
fi
#if [ -a /var/log/install_level ]
#  then echo "Installed version: " && cat /var/log/install_level
#fi
######Partition size (optional, can be commented)################
#echo "Partition sizes"
#df -h
 
#################################################################

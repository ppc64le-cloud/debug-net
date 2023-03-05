#!/bin/bash

#Written by Mick Tarsel
#create a network "snapshot"
#Only shows IPv4  

OUT_DIR="/home/network-snapshot-output"
OUT_FILE=$OUT_DIR/$(date +"%m-%d-%Y")-outputski.txt

title () {
    echo "" &>> $OUT_FILE;
    echo "" &>> $OUT_FILE;
    echo "" &>> $OUT_FILE;
    echo "#####################" &>> $OUT_FILE;
    echo "  $1  " &>> $OUT_FILE;
    echo "#####################" &>> $OUT_FILE;
    echo "" &>> $OUT_FILE;
}

command_out () {
    #the first parameter of this func is the command. save output to file
    $1 &>> $OUT_FILE
}

mkdir -p $OUT_DIR
touch $OUT_FILE

primary_interface=$(ip -o -4 route show to default | awk '{print $5}')
#list default route and assume that device is primary interface
hostname=$(cat /etc/hostname)

title "Hostname: $hostname"

title "Default Route Network Interface: $primary_interface"

title "IPv4 Addresses"
command_out "ip -4 addr"

title "IP Link Stats"
command_out "ip -4 -s link show"

title "Netstat Stats"
command_out "netstat -4 -s"

title "Netstat Listening Ports"
command_out "netstat -tulpn | grep LISTEN"

title "ARP"
command_out "arp"

title "Route"
command_out "route -n" 

title "IP Route"
command_out "ip -4 route"

title "IP Neighbor"
command_out "ip -4 neigh show"

title "All IP Addresses"
command_out "ip addr"

title "ethtool info for $primary_interface"
command_out "ethtool -i $primary_interface"

title "ethtool Stats for $primary_interface"
command_out "ethtool -S $primary_interface"

title "ethtool Features for $primary_interface"
command_out "ethtool -k $primary_interface"

echo "Network info saved in $OUT_FILE"

#Some other helpful places to check :) 
#cat  /proc/sys/net/ipv4/conf
#iptables-save -c
#journalctl -u Network-Manager.service --no-pager

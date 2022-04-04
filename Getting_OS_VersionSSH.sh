#!/bin/bash

# 8.Using bash write a script to get OS version from multiple Linux servers
#
# Premisses:
#    • The script must receive an argument to process, which is the file name (myservers_list.txt);
#    • You will use 'ssh' command to connect into different servers using 'myuser' as the username ;
#
# The result should be writted in the file 'servers_version.txt' using the format bellow:
# date (hh:mm:ss mm/dd/yy)    <server name>      <server ip>    <server version> 
#
# E.g:
# 18:53:44 12/10/21    webserver001   192.168.80.5   Linux (none) 2.6.34.14 ##44 Tue Oct 15 20:50:15 CEST 2013 i686 GNU/Linux
# R:.

#########################################################################
# Exercise 8 - Getting OS version from multiple Linux servers via SSH   #                                    
#                                                                       #
# Name: Getting_OS_VersionSSH.sh                                        #
#                                                                       #
# Author: Eduardo Castellini Dourado (eduardo@eduardocastellini.com.br) #
#                                                                       #
# Date: 03/04/2022                                                      #
# Description: Get via SSH the OS version and the "uname -a" command    #
# info from the hosts with the Ip in the file passed as the first       #
# execution argument and saved in the "servers_version.txt" file.       #
#                                                                       #
# Use: ./Getting_OS_VersionSSH.sh <myservers_list.txt>                  #
#                                                                       #
#########################################################################


if [ $# -eq 0 ] #Checking if the argument with the server IPs file was typed or not
then
    echo " *****----- Please enter the IP file of the servers like this example: ./Getting_OS_VersionSSH.sh myservers_list.txt -----***** "
    exit 1
else
    echo "*****----- Checking remote servers please wait -----*****"
    SERVERLIST=$1
    USERNAME="myuser"
    PASS="myuser" #No mention of how to enter the SSH password for "myuser" user was placed so it follows that it will be inserted directly into the script as the user was.

    for ip in $(cat $1)
    do
        sshpass -p $PASS ssh -l $USERNAME $ip "(date +%X' '%x; hostname; echo $ip; uname -a) |tr '\n' '\t\t'; echo " "; " >> servers_version.txt 2>&1 
        #In this case, the result file presents both the result of the correct connection as well as possible error messages (host not accessible, loggin errors, etc.) are append on the result file
    done
fi
echo " "
echo "*****----- Check finished by servers saved in $1, please refer to file servers_version.txt to see results. -----*****"
exit 0

#!/bin/bash

# 9.Using bash write a script to find and remove duplicated fake IP addresses lines of "control_file.txt" file and save the output at /tmp/output_1.txt
#
# Premisses:
#    • The script must receive an argument to process, which is the file name (control_file.txt);
#    • Find duplicated fake IP addresses and keep just the first one. All other duplicated IP addresses must be removed;
#
# E.g:
# Using the lines below as example, the second one must be deleted:
# 540.300.759.124 lnx02csv lnx02csv.02csv.sps pid=1 ia1=y domain=02csv myid=2 wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM 
# 540.300.759.124 lnx02csv lnx02csv.02csv.sps pid=1 ia1=y domain=02csv myid=3 wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM 

# The final expected result is:
# 540.300.759.124 lnx02csv lnx02csv.02csv.sps pid=1 ia1=y domain=02csv myid=2 wsm=PR wid=1 wst=NA,HI,CP,SC,DS # ADM
#    • All comment lines must be kept on the final output file.
#

#########################################################################
# Exercise 9 - Remove duplicate records in file and save to a new one.  #                                    
#                                                                       #
# Name: RemoveDuplicates.sh                                             #
#                                                                       #
# Author: Eduardo Castellini Dourado (eduardo@eduardocastellini.com.br) #
#                                                                       #
# Date: 03/04/2022                                                      #
# Description: The Script reads the file passed in the 1st argument and #
# eliminates the second lines with repeated IPs and saves the result    #
# in the /tmp/output_1.txt file.                                        #
#                                                                       #
# Use: ./RemoveDuplicates.sh <control_file.txt>                         #
#                                                                       #
#########################################################################


if [ $# -eq 0 ] #Checking if the argument with the server IPs file was typed or not
then
    echo " *****----- Please enter the file for Checking as the example: ./RemoveDuplicates.sh <control_file.txt> -----***** "
    exit 1
else
    echo "*****----- Checking File -----*****"
    sort control_file.txt| awk '!a[$1]++' > /tmp/output_1.txt
fi
echo " "
echo "*****----- Check finished in $1 file, please refer to file /tmp/output_1.txt to see results.-----*****"
exit 0

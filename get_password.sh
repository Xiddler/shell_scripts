#!/bin/bash

# This script is called in the shell using 'gett'. My most frequent passwords are in the common_passwords.csv file for handiness.

grep -i $1 $HOME/common_passwords.csv | awk 'BEGIN {FS=","}{ print $2 "\n "$3"\n "$4"\n "$5}' | sed 's/^ //g'

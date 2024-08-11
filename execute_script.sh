#!/bin/bash

result=''
echo "Name of python script to execute: $1"
filename=$1

{ # try

    result=$(find ~/"Desktop" -maxdepth 12 -type f -name $filename)

} || { # catch

    printf "Could not find %s\n bye...\n" $filename
    exit 0

}

if [ "$result" != ' ' ]; then
    echo "${result}"

    python3 $result $2 $3 #python or python3 depending on system
    exit 0
else
    echo Failure
    exit 0
fi









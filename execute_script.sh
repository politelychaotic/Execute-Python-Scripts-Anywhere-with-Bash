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

    { # try `python`

       printf "Trying 'python'...\n"
       python $result $2 $3


   } || { # catch, try `python3`

       printf "'python' failed, trying 'python3\n"
       python3 $result $2 $3

   }

    exit 0
else
    echo Failure
    exit 0
fi








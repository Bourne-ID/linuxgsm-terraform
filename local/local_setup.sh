#!/usr/bin/env bash

# check the number of commands, display usage if not 1
if [ $# -ne 1 ]; then
    echo "Usage: ./setup.sh servername"
    exit 1
fi

# get server name - we'll use this and let linuxgsm error if wrong.
servername=${1}

# Local: Configure vagrant file to call the lgsm script on provision




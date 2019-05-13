#!/bin/sh

# File: entrypoint.sh
# Author: Dmitri G.
# Date: 2019-05-13

# Used for additional system configuration

set -e

# *** Sudo service run example ***
# sudo service servicename start

if [ -z "$1" ]
then
    echo "Starting BASH..."
    /bin/bash

    # *** NOT USED in current configuration!!! Just skip ***
    # echo "Starting Netcat..."
    # nc -lrp 2323 -e '/bin/bash'
    # *** NOT USED in current configuration!!! ***

else
    pio "$@"
fi


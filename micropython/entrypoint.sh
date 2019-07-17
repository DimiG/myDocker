#!/bin/sh

# File: entrypoint.sh
# Author: Dmitri G.
# Date: 2019-07-17

# Used for additional system configuration

set -e

# *** Sudo service run example ***
# sudo service servicename start

if [ -z "$1" ]
then
    echo "Starting BASH..."
    /bin/bash
else
    echo "Running the Rshell..."
    rshell "$@"
fi


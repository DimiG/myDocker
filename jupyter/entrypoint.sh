#!/bin/sh
# File: entrypoint.sh
# Author: Dmitri G.
# Date: 2021-06-29

set -e

if [ -z "$1" ]
then
    echo "Starting Tini..."

    /usr/bin/tini -- jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root

else
    echo "Starting BASH..."
    /bin/bash
fi


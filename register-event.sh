#!/bin/sh -l

export PATH=$PATH:/app/cmd/pipectl

if [ -z "$5" ]
then
    pipectl event register \
        --address=$1 \
        --api-key=$2 \
        --name=$3 \
        --data=$4
else
    pipectl event register \
        --address=$1 \
        --api-key=$2 \
        --name=$3 \
        --data=$4 \
        --labels=$5
fi

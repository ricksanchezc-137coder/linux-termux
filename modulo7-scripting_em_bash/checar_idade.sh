#!/bin/bash

idade=$1

if [ "$idade" -lt 0 ]; then
    echo "idade invalida"
elif [ "$idade" -lt 18 ]; then
    echo "menor de idade"
else
    echo "maior de idade"
fi

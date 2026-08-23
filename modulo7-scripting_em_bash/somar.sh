#!/bin/bash

somar() {
    echo $(( $1 + $2 ))
}

resultado=$(somar 3 5)
echo "Resultado: $resultado"


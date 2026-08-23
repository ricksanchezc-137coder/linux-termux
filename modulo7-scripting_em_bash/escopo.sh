#!/bin/bash

x=10

alterar() {
    local x=20
    echo "Dentro da funcao: $x"
}
alterar
echo "Fora da funcao: $x"

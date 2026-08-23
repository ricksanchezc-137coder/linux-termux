#!/bin/bash

frutas=("maça" "banana" "laranja")

echo "Primeira fruta: ${frutas[0]}"
echo "Total de frutas: ${#frutas[@]}"

for fruta in "${frutas[@]}"; do
    echo "Fruta: $fruta"
done

frutas+=("uva")
unset frutas[1]
echo "Depois das alterações:"
for fruta in "${frutas[@]}"; do
    echo "Fruta: $fruta"
done

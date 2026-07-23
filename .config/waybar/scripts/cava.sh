#!/bin/bash

bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

while read -r line; do
    output=""

    for value in $line; do
        [[ "$value" =~ ^[0-9]+$ ]] || continue
        (( value > 7 )) && value=7
        output+="${bars[$value]}"
    done

    echo "$output" | cut -c1-12
done < /tmp/cava.fifo

#!/bin/bash

FAIL="/home/sander/Documents/scripts/laiendid.txt"

if [ ! -f "$FAIL" ]; then
    echo "Viga: fail $FAIL ei leitud!"
    exit 1
fi

laiend=$(shuf -n 1 "$FAIL")
echo "$laiend" >> /home/sander/Documents/scripts/random.txt
echo "Lisatud: $laiend"
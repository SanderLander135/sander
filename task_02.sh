#!/bin/bash

if [ -z "$1" ]; then
    echo "Viga: anna laiend kaasa! Näide: ./task_02.sh .txt"
    exit 1
fi

LAIEND="$1"
FAIL="/home/sander/Documents/scripts/random.txt"

if [ ! -f "$FAIL" ]; then
    echo "Viga: fail $FAIL ei leitud!"
    exit 1
fi

KOGUS=$(grep -c "^${LAIEND}$" "$FAIL")

if [ "$KOGUS" -eq 0 ]; then
    echo "Laiendit $LAIEND ei leitud random.txt failist!"
else
    echo "Laiend $LAIEND esines $KOGUS korda random.txt failist!"
fi
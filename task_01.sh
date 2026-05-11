#!/bin/bash

# This is a simple bash script that clears the terminal and prints the bash version.
clear

# Loe laiendite faili (failinimi on skriptis, mitte kasureal!)
# Faili olemasolu kontrollimine
# Võta üks juhuslik laiend failist ja lisa uude faili nimega random.txt
# Iga kord kui kaivitatakse, lisataks faili üks uus juhuslik laiend uue reale.
# Käivitades näiteks 100 korda, siis on random.txt failis 100 rida, kus iga rida on üks juhuslik laiend.

# Kui skript töötab, provi kasurealt kaivitada skript 100 korda!(Automaatiliselt, mitte käsitsi!)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE_FILE="$SCRIPT_DIR/extensions.txt"
OUTPUT_FILE="random.txt"

COUNT=${1:-1}

# Check if the source file exists
if [ -f "$SOURCE_FILE" ]; then
    # Read the extensions from the source file into an array
    mapfile -t extensions < "$SOURCE_FILE"

    # Check if the extensions array is empty
    if [ ${#extensions[@]} -eq 0 ]; then
        echo "Error: '$SOURCE_FILE' is empty."
        exit 1
    fi

    echo "Adding $COUNT random extensions to file '$OUTPUT_FILE'..."
    # Add random extensions to the output file
    for (( i=0; i<COUNT; i++ )); do
        random_index=$(( RANDOM % ${#extensions[@]} ))
        random_extension="${extensions[$random_index]}"
        echo "$random_extension" >> "$OUTPUT_FILE"
    done
    echo "Ready"
else
    echo "Error: File '$SOURCE_FILE' not found."
    exit 1
fi

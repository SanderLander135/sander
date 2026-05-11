#!/bin/bash

# This is a simple bash script that clears the terminal and prints the bash version.
clear

# 1. Controll if the user provided an extension as an argument
EXTENSION=$1
FILE="random.txt"

# Check if the extension argument is provided
if [ -z "$EXTENSION" ]; then
    echo "Error: No extension provided! Usage: $0 <extension>"
    exit 1
fi

# 2. Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found! Run task_01.sh first."
    exit 1
fi

# 3. Check for the extension in the file
AMOUNT=$(grep -x "$EXTENSION" "$FILE" | wc -l)

# 4. Output based on the result
if [ "$AMOUNT" -gt 0 ]; then
    echo "Extension '$EXTENSION' found in file '$FILE': $AMOUNT times."
else
    echo "Extension '$EXTENSION' not found in file '$FILE'."
fi
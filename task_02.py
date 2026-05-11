import os
import sys

def task_02():

    os.system('cls' if os.name == 'nt' else 'clear')

    if len(sys.argv) < 2:
        print(f"Error: Extension not provided! Usage: python {sys.argv[0]} <extension>")
        sys.exit(1)

    extension = sys.argv[1]
    file_name = "random.txt"

    if not os.path.exists(file_name):
        print(f"Error: File '{file_name}' not found! Run task_01.py first.")
        sys.exit(1)

    with open(file_name, 'r') as f:
        lines = f.read().splitlines()
        amount = lines.count(extension)

    if amount > 0:
        print(f"Extension '{extension}' was found in file '{file_name}': {amount} times.")
    else:
        print(f"Extension '{extension}' was not found in file '{file_name}'.")

if __name__ == "__main__":
    task_02()
import os
import sys
import random

def task_01():
    os.system('cls' if os.name == 'nt' else 'clear')

    script_dir = os.path.dirname(os.path.abspath(__file__))
    source_file = os.path.join(script_dir, "extensions.txt")
    output_file = "random.txt"

    count = int(sys.argv[1]) if len(sys.argv) > 1 else 1

    if os.path.exists(source_file):
        with open(source_file, 'r') as f:
            extensions = f.read().splitlines()

        if not extensions:
            print(f"Error: '{source_file}' is empty.")
            sys.exit(1)

        print(f"Adding {count} random extensions to file '{output_file}'...")
        
        with open(output_file, 'a') as f_out:
            for _ in range(count):
                random_ext = random.choice(extensions)
                f_out.write(random_ext + "\n")
        
        print("Done")
    else:
        print(f"Error: File '{source_file}' not found.")
        sys.exit(1)

if __name__ == "__main__":
    task_01()
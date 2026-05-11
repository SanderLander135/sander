#!/usr/bin/env python3

# Impordime vajalikud moodulid
import sys  # käsurea argumentide lugemiseks ja väljumiseks
import os   # faili olemasolu kontrollimiseks

# Kontrollime, kas kasutaja andis laiendi kaasa käsureal
if len(sys.argv) < 2:
    print("Viga: anna laiend kaasa! Näide: python3 task_02.py .txt")
    sys.exit(1)

# Võtame laiendi esimesest käsurea argumendist
laiend = sys.argv[1]

# Määrame random.txt faili asukoha (samasse kausta skriptiga)
SKRIPTI_KAUST = os.path.dirname(os.path.abspath(__file__))
RANDOM_FAIL = os.path.join(SKRIPTI_KAUST, "random.txt")

# Kontrollime, kas random.txt fail on olemas
if not os.path.isfile(RANDOM_FAIL):
    print(f"Viga: fail {RANDOM_FAIL} ei leitud!")
    sys.exit(1)

# Loeme kõik read failist ja loendame täpsed vasted
with open(RANDOM_FAIL, "r") as f:
    read = f.readlines()

# Loendame, mitu korda esineb täpselt otsitav laiend (rea kaupa)
kogus = sum(1 for rida in read if rida.strip() == laiend)

# Kuvame tulemuse vastavalt sellele, kas laiendit leiti või mitte
if kogus == 0:
    print(f"Laiendit {laiend} ei leitud random.txt failist!")
else:
    print(f"Laiend {laiend} esines {kogus} korda random.txt failist!")

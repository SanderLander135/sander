#!/usr/bin/env python3

# Impordime vajalikud moodulid
import random  # juhusliku valiku tegemiseks
import os      # faili olemasolu kontrollimiseks
import sys     # programmist väljumiseks vea korral

# Määrame failide asukohad (samasse kausta skriptiga)
SKRIPTI_KAUST = os.path.dirname(os.path.abspath(__file__))
LAIENDITE_FAIL = os.path.join(SKRIPTI_KAUST, "laiendid.txt")
RANDOM_FAIL = os.path.join(SKRIPTI_KAUST, "random.txt")

# Kontrollime, kas laiendite fail on olemas
if not os.path.isfile(LAIENDITE_FAIL):
    print(f"Viga: fail {LAIENDITE_FAIL} ei leitud!")
    sys.exit(1)

# Loeme kõik laiendid failist, eemaldame tühjad read
with open(LAIENDITE_FAIL, "r") as f:
    laiendid = [rida.strip() for rida in f.readlines() if rida.strip()]

# Kontrollime, et failis on vähemalt üks laiend
if not laiendid:
    print("Viga: laiendid.txt on tühi!")
    sys.exit(1)

# Valime juhusliku laiendi nimekirjast
laiend = random.choice(laiendid)

# Kirjutame valitud laiendi random.txt faili (lisame lõppu)
with open(RANDOM_FAIL, "a") as f:
    f.write(laiend + "\n")

# Kuvame kasutajale teate lisatud laiendi kohta
print(f"Lisatud: {laiend}")

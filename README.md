# Skriptimise projekt - Mykyta

See projekt on loodud õppeülesande raames ning sisaldab lahendusi kolmes programmeerimiskeeles: **Bash**, **Python** ja **PowerShell**. Skriptid tegelevad faililaiendite haldamise, juhusliku genereerimise ja statistika kogumisega.

## Projekti struktuur

```text
mykyta/
├── extensions.txt      # Algfail 10 erineva laiendiga
├── task_01.sh          # Bash skript juhuslike laiendite lisamiseks
├── task_02.sh          # Bash skript laiendite loendamiseks
├── task_01.py          # Pythoni versioon ülesandest 01
├── task_02.py          # Pythoni versioon ülesandest 02
└── TwoTask/            # PowerShell moodul
    ├── TwoTask.psm1    # Mooduli funktsioonid (Task01 ja Task02)
    └── TwoTask.psd1    # Mooduli manifest
```

## Paigaldamine

### 1. Visual Studio Code seadistamine
Pythoni skriptide korrektseks töötamiseks installige terminalis Pythoni laiendus:
```bash
code --install-extension ms-python.python
```

### 2. Bash skriptide õigused
Enne Bash skriptide kasutamist Linuxi keskkonnas andke neile käivitusõigus:
```bash
chmod +x task_01.sh task_02.sh
```

### 3. Fail "extensions.txt"
Veenduge, et kaustas on olemas fail `extensions.txt`, mis sisaldab 10 rida erinevate laienditega.

---

## Kasutamine

### Bash skriptid
*   **Task 01** (lisab juhusliku laiendi faili `random.txt`):
    ```bash
    ./task_01.sh 100
    ```
    *(Argument `100` määrab, mitu korda juhuslikku laiendit lisatakse)*
*   **Task 02** (otsib laiendit failist):
    ```bash
    ./task_02.sh txt
    ```

### Pythoni skriptid
*   **Task 01**:
    ```bash
    python task_01.py 50
    ```
*   **Task 02**:
    ```bash
    python task_02.py pdf
    ```

### PowerShell moodul
Mooduli kasutamiseks tuleb see esmalt importida:
1. Avage PowerShell projekti kaustas.
2. Importige moodul:
   ```powershell
   Import-Module .\TwoTask\TwoTask.psd1
   ```
3. Kasutage funktsioone:
   ```powershell
   Task01 -Count 10
   Task02 -Extension "sh"
   ```

---
#### Autor: Mykyta Minaiev (Nik3310)(IT25)
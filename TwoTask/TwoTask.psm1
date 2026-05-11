# TwoTask.psm1 - PowerShell mooduli põhifail
# Sisaldab kahte avalikku funktsiooni: Task01 ja Task02

function Task01 {
    <#
    .SYNOPSIS
        Valib juhusliku laiendi laiendid.txt failist ja lisab selle random.txt faili.
    .DESCRIPTION
        Funktsioon loeb laiendid.txt failist kõik laiendid, valib neist juhusliku
        ning lisab selle random.txt faili. Põhineb task_01.sh Bash-skriptil.
    .EXAMPLE
        Task01
    #>

    # Määrame failide asukohad (mooduli kaustast üks tase ülespoole)
    $MooduliKaust = Split-Path -Parent $PSScriptRoot
    $LaiendidFail = Join-Path $MooduliKaust "laiendid.txt"
    $RandomFail   = Join-Path $MooduliKaust "random.txt"

    # Kontrollime, kas laiendite fail on olemas
    if (-not (Test-Path $LaiendidFail)) {
        Write-Host "Viga: fail $LaiendidFail ei leitud!"
        return
    }

    # Loeme laiendid failist ja eemaldame tühjad read
    $Laiendid = Get-Content $LaiendidFail | Where-Object { $_.Trim() -ne "" }

    # Kontrollime, et failis on vähemalt üks laiend
    if (-not $Laiendid) {
        Write-Host "Viga: laiendid.txt on tühi!"
        return
    }

    # Valime juhusliku laiendi massiivist
    $Laiend = $Laiendid | Get-Random

    # Lisame valitud laiendi random.txt faili lõppu
    Add-Content -Path $RandomFail -Value $Laiend

    # Kuvame kasutajale teate
    Write-Host "Lisatud: $Laiend"
}

function Task02 {
    <#
    .SYNOPSIS
        Loendab, mitu korda esineb antud laiend random.txt failis.
    .DESCRIPTION
        Funktsioon võtab parameetrina laiendi ning otsib seda random.txt failist.
        Kuvab, mitu korda täpselt see laiend esineb. Põhineb task_02.sh Bash-skriptil.
    .PARAMETER Laiend
        Otsitav faililaiend, näiteks .txt
    .EXAMPLE
        Task02 -Laiend ".txt"
    #>

    param (
        # Kohustuslik parameeter - otsitav laiend
        [Parameter(Mandatory = $true)]
        [string]$Laiend
    )

    # Määrame random.txt faili asukoha (mooduli kaustast üks tase ülespoole)
    $MooduliKaust = Split-Path -Parent $PSScriptRoot
    $RandomFail   = Join-Path $MooduliKaust "random.txt"

    # Kontrollime, kas random.txt fail on olemas
    if (-not (Test-Path $RandomFail)) {
        Write-Host "Viga: fail $RandomFail ei leitud!"
        return
    }

    # Loeme kõik read failist
    $Read = Get-Content $RandomFail

    # Loendame täpsed vasted (iga rida eraldi, tühikud eemaldatud)
    $Kogus = ($Read | Where-Object { $_.Trim() -eq $Laiend }).Count

    # Kuvame tulemus vastavalt sellele, kas laiendit leiti või mitte
    if ($Kogus -eq 0) {
        Write-Host "Laiendit $Laiend ei leitud random.txt failist!"
    } else {
        Write-Host "Laiend $Laiend esines $Kogus korda random.txt failist!"
    }
}

# Ekspordime mõlemad funktsioonid avalikuks kasutamiseks
Export-ModuleMember -Function Task01, Task02

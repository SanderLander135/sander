function Task01 {
    <#
    .SYNOPSIS
    Adds random extensions to the random.txt file (based on Bash task_01.sh).
    #>
    param (
        [int]$Count = 1
    )

    Clear-Host
    $sourceFile = Join-Path $PSScriptRoot "..\extensions.txt"
    $outputFile = "random.txt"

    if (Test-Path $sourceFile) {
        $extensions = Get-Content $sourceFile
        if ($extensions.Count -eq 0) {
            Write-Error "File $sourceFile is empty."
            return
        }

        Write-Host "Adding $Count random extensions to file $outputFile..."
        
        for ($i = 0; $i -lt $Count; $i++) {
            $randomExt = $extensions | Get-Random
            Add-Content -Path $outputFile -Value $randomExt
        }
        Write-Host "Done"
    } else {
        Write-Error "File $sourceFile not found."
    }
}

function Task02 {
    <#
    .SYNOPSIS
    Counts the occurrences of an extension in the random.txt file (based on Bash task_02.sh).
    #>
    param (
        [string]$Extension
    )

    Clear-Host
    $file = "random.txt" 

    if (-not $Extension) {
        Write-Error "Error: Extension not provided!"
        return
    }

    if (Test-Path $file) {
        $content = Get-Content $file
        $matches = $content | Where-Object { $_ -eq $Extension } 
        $amount = ($matches | Measure-Object).Count

        if ($amount -gt 0) {
            Write-Host "Extension '$Extension' was found in file '$file': $amount times."
        } else {
            Write-Host "Extension '$Extension' was not found in file '$file'."
        }
    } else {
        Write-Error "Error: File $file not found! Run Task01 first."
    }
}

Export-ModuleMember -Function Task01, Task02
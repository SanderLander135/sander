#
# TwoTask.psd1 - PowerShell mooduli manifest (kirjeldusfail)
# Sisaldab mooduli metaandmeid ja seadistusi
#

@{
    # Mooduli põhifail, mis sisaldab funktsioone
    RootModule        = 'TwoTask.psm1'

    # Mooduli versiooninumber
    ModuleVersion     = '1.0.0'

    # Unikaalne identifikaator sellele moodulile
    GUID              = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890'

    # Mooduli autor
    Author            = 'Sander'

    # Lühikirjeldus mooduli eesmärgist
    Description       = 'TwoTask moodul sisaldab kahte ülesannet: Task01 lisab juhusliku laiendi random.txt faili ja Task02 loendab laiendi esinemiskordi.'

    # Minimaalne nõutav PowerShelli versioon
    PowerShellVersion = '5.1'

    # Avalikud funktsioonid, mis on moodulist kasutatavad
    FunctionsToExport = @('Task01', 'Task02')

    # Käsud, muutujad ja aliases mida ei ekspordita (tühi - kõik on juba FunctionsToExport all)
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
}

function Start-Venv {
    param (
        [string]$PathToActivate = ".venv\Scripts\Activate.ps1"
    )

    . $PathToActivate
    
}

function Build-Python {
    [CmdletBinding()]
    param (
        [string]$PathToProject = ".",
        [string]$File = "main.py",
        [bool]$RunExecutable = $false
    )

    Set-Location $PathToProject
    
    Start-Venv

    pyinstaller $File --clean

    if ($RunExecutable) {
        . ".\dist\main\main.exe"
    }
}
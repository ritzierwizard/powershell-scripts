function Install-Fonts {
    [CmdletBinding()]
    param (
        [string]$path
    )
    
    $ShellObject = New-Object -ComObject shell.application
    $Fonts = $ShellObject.NameSpace(0x14)
    $FontsToInstallDirectory = $path
    $FontsToInstall = Get-ChildItem $FontsToInstallDirectory -Recurse -Include '*.ttf', '*.ttc', '*.otf'
    $Ctr = 1
    $Total = $FontsToInstall.Count
    ForEach ($F in $FontsToInstall) {
        $FullPath = $F.FullName
        $Name = $F.Name
        $UserInstalledFonts = "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\Fonts"
        If (!(Test-Path "$UserInstalledFonts\$Name")) {
            $Fonts.CopyHere($FullPath)
            Write-Host "[$Ctr of $Total] || Installed Font $Name...moving on!" -ForegroundColor Cyan
        }
        else {
            Write-Host "[$Ctr of $Total] || Font $Name is already installed bro..." -ForegroundColor Green
        }
        $Ctr++
    }
}

function Get-FunctionDefinition {
    [CmdletBinding()]
    param (
        [string]$Function
    )

    (Get-Command $Function).Definition
}

function Clear-Dir {
    [CmdletBinding()]
    param (
        [string]$Path
    )
    Get-ChildItem $Path -Recurse | Remove-Item
}

function Copy-Contents {
    [CmdletBinding()]
    param (
        [string]$Path,
        [string]$Destination
    )
    Copy-Item -Path "$Path\*" -Destination $Destination -Recurse
}

function New-Session {
    Start-Process wt.exe
    Stop-Process -Id $pid
}

function New-ElevatedSession {
    Start-Process -Verb RunAs wt.exe
    Stop-Process -Id $pid
}

function Test-Elevation {
    If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {    
        Write-Output "This script needs to be run As Admin"
        exit
    }
}

function Head {
    [CmdletBinding()]
    param (
        [string]$Path,
        [Int64]$lines = 10
    )
    Get-Content -Path $Path -Head $lines
}

function Tail {
    [CmdletBinding()]
    param (
        [string]$Path,
        [Int64]$lines = 10
    )
    Get-Content -Path $Path -Tail $lines
}
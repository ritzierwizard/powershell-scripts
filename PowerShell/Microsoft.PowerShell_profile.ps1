$PSStyle.FileInfo.Directory = "`e[93;1m"
[string[]]$functions = (Get-ChildItem "$env:DOCUMENTS\Powershell Scripts\Functions" -Recurse -Include "*.ps1")
foreach ($func in $functions) {
    . $func
}

[string]$PathToScripts = "$env:DOCUMENTS\Powershell Scripts"

Import-Module gsudoModule
Set-Alias Prompt gsudoPrompt
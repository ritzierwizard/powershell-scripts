function Add-AssemblyProject {
    [CmdletBinding()]
    param (
        [string] $Name,
        [string] $Path = "."
    )
    if (Test-Path $Path -PathType Container) {
        if (!($Path.Equals("."))) {
            Set-Location $Path
        }
        $newFolder = $Path + $Name
        if (!(Test-Path $newFolder -PathType Container)) {
            mkdir $Name
            Set-Location $Name
            mkdir src
            mkdir out

            "; INCLUDELIB ucrt.lib`n; INCLUDELIB legacy_stdio_definitions.lib`n`n; EXTERN printf: PROC`n`n.DATA`n`n.CODE`nmain PROC`n    ret`nmain ENDP`n`nEND" > "src\$Name.asm"
        }
    }
}
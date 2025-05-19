function Add-TypstProject {
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
            Copy-Item -Recurse "$env:userprofile\OneDrive\Documents\Sublime Templates\sublime_typst" $Name 
            Set-Location $Name
        }
    }
}

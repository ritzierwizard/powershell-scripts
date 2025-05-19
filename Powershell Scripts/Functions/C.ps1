function Add-CppProject {
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
            Copy-Item -Recurse "$env:DOCUMENTS\Sublime Templates\sublime_c++" $Name 
            Set-Location $Name
        }
    }
}

function Get-CppFiles {
    [CmdletBinding()]
    param (
        [string] $Path = "."
    )

    $result = ""

    $files = Get-ChildItem -Path $Path -Filter *.cpp
    if (Test-Path -PathType Leaf -Path "${Path}\main.cpp") {
        $result += "main.cpp "
    }

    foreach ($file in $files) {
        if (!($file.Name.Equals("main.cpp"))) {
            $result += $file.Name + " "
        }
    }

    $result.Trim()
    Set-Clipboard $result
}

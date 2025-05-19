function Set-UserEnvironmentVariable {
    [CmdletBinding()]
    param (
        [string]$name,
        $value = $PWD.Path
    )

    [System.Environment]::SetEnvironmentVariable($name, $value, [System.EnvironmentVariableTarget]::User)
}

function Set-SystemEnvironmentVariable {
    [CmdletBinding()]
    param (
        [string]$name,
        $value = $PWD.Path
    )
    
    Test-Elevation
    [System.Environment]::SetEnvironmentVariable($name, $value, [System.EnvironmentVariableTarget]::Machine)
}

function Remove-UserEnvironmentVariable {
    [CmdletBinding()]
    param (
        [string]$name
    )

    [System.Environment]::SetEnvironmentVariable($name, $null, [System.EnvironmentVariableTarget]::User)
}

function Remove-SystemEnvironmentVariable {
    [CmdletBinding()]
    param (
        [string]$name
    )

    Test-Elevation
    [System.Environment]::SetEnvironmentVariable($name, $null, [System.EnvironmentVariableTarget]::Machine)
}

function Get-DeveloperVariables64 {
    $env:Path += "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.42.34433\bin\Hostx64\x64"
}

function Get-DeveloperVariables32 {
    $env:Path += "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.42.34433\bin\Hostx64\x86"
}
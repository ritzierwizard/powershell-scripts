function Test-FileHash {
    [CmdletBinding()]
    param (
        [string]$path,
        [string]$expectedHash
    )

    (Get-FileHash $path).Hash -eq $expectedHash
}
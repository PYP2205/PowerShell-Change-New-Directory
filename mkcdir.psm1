function Set-NewDirectory {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $NewDirectory
    )

    if ($NewDirectory -eq "")
    {
        Write-Warning "`nPlease enter a directory name!`n"
    } else {
        $rd = Get-Location
        $dir = "${rd}\${NewDirectory}"
        New-Item -Path . -ItemType Directory -Name $NewDirectory | Out-Null
        Set-Location $dir
    }
    
}
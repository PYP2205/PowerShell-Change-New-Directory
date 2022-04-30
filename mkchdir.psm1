<#
Created by: Paramon Yevstigneyev
#>
# PowerShell Function that will change your local directory to new director(y/ies) that the user specifies.
function Set-NewDirectoryLocation
{
    # User string parameter for creating new director(y/ies)
    param ([string]$NewDirectoryName)
    try {
        if ($NewDirectoryName -eq "")
        {
            Write-Warning "`nPlease enter a directory name to create`n"
        } else
        {
            # Gets the user's running directory
            $rundir = Get-Location
            # Format's the running directory with the new director(y/ies)
            $dir = "${rundir}\${NewDirectoryName}"
            # Creates the director(y/ies)
            New-Item -Path . -ItemType Directory -Name $NewDirectoryName | Out-Null
            # After the new director(y/ies) are made, it will set the user location to the new path.
            Set-Location $dir
        }
    # If any error occurs, then it will write the error out into the console.
    } catch {
        Write-Error
    }
}

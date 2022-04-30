# PowerShell function that will set the users location to the name of the new directory 
function Set-NewLocation {
    [CmdletBinding()]
    # String paramter which is recived by the user, to 
    param (
        [Parameter()]
        [string]
        $NewDirectory
    )
    # If the user does not enter a name for the new directory, then it will write a warning to the user.
    if ($NewDirectory -eq "")
    {
        Write-Warning "`nPlease enter a directory name!`n"
    # If the user enters a name for the new dicretory, then it will create the new directory and set the users location to the new directory.
    } else {
        # Gets the current running directory
        $rd = Get-Location
        # Formats the user's location and the new directory into one string
        $dir = "${rd}\${NewDirectory}"
        
        # Creates the new directory in the user's running directory and changes it to the new directory.
        New-Item -Path . -ItemType Directory -Name $NewDirectory | Out-Null
        Set-Location $dir
    }
    
}

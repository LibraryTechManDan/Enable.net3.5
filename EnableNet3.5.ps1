try {
    # Ensure the script is run as an administrator
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Error "This script must be run as an administrator."
        exit
    }

    # Install .NET Framework 3.5 using the Add-WindowsCapability cmdlet
    Write-Host "Installing .NET Framework 3.5 from Windows Updates..." -ForegroundColor Green

    $result = Add-WindowsCapability -Online -Name "NetFx3~~~~"

    if ($result.Status -eq "Success") {
        Write-Host ".NET Framework 3.5 installed successfully." -ForegroundColor Green
    } else {
        Write-Host ".NET Framework 3.5 installation encountered issues. Status: $($result.Status)" -ForegroundColor Yellow
    }
} catch {
    Write-Error "An error occurred: $_"
}

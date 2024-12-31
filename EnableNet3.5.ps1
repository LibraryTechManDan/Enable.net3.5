# Run this PowerShell script as Administrator

try {
    # Attempt to enable the .NET Framework 3.5 feature
    Write-Host "Starting .NET Framework 3.5 installation..." -ForegroundColor Green
    $result = Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All -ErrorAction Stop

    # Check if the installation was successful
    if ($result.RestartNeeded -eq $true) {
        Write-Host "Installation was successful, but a restart is required." -ForegroundColor Yellow
    } else {
        Write-Host "Installation completed successfully without needing a restart." -ForegroundColor Green
    }
} catch {
    # Catch and handle errors
    Write-Host "An error occurred during the installation process:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

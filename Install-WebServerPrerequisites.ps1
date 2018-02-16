pparam (
    [parameter()]
    [ValidateNotNullOrEmpty()]
    [String]$NewRelicLicenseKey
)

Write-Host "Installing Chocolatey..."
.\install.ps1

Write-Host "Installing Octopus Deploy DSC Extension..."
.\Install-OctopusDSC.ps1

Write-Host "Installing Roles..."
Import-Csv .\Roles.csv | foreach{Add-WindowsFeature $_.name  }

Write-Host "Installing webdeploy..."
choco install webdeploy /y

Write-Host "installing urlrewrite..."
choco install urlrewrite /y

$file = "$env:windir\System32\drivers\etc\hosts"
"172.30.2.100 spark-octo.equator-live.com" | Add-Content -PassThru $file

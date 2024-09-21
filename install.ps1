Param(
    [string]$ProjectName,
    [string]$Namespace,
    [string]$SonarCloudUrl,
    [string]$HealthChecksId
)

Write-Host "Setting up project: $ProjectName"

# Update .wakatime and README.md
(Get-Content .wakatime-project) -replace 'TemplateProject', $ProjectName | Set-Content .wakatime-project
(Get-Content README.md) -replace 'TemplateProject', $ProjectName | Set-Content README.md

# Update composer.json
(Get-Content composer.json) -replace 'TemplateNamespace', $Namespace | Set-Content composer.json

# Update Healthchecks.io badge
Write-Host "Please create a HealthChecks.io account if needed."
(Get-Content README.md) -replace 'HealthChecksId', $HealthChecksId | Set-Content README.md

# Update SonarCloud URL
(Get-Content README.md) -replace 'SonarCloudUrl', $SonarCloudUrl | Set-Content README.md

# Run composer install
Write-Host "Running composer install..."
composer install

Write-Host "Project setup complete."

# Additional PHP setup tasks
Write-Host "Performing additional PHP setup tasks..."
# Add any additional setup commands here

Write-Host "Setup finished successfully."
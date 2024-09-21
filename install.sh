#!/bin/bash

echo "Enter the project name:"
read -r project_name

echo "Enter the default namespace:"
read -r namespace

echo "Enter the SonarCloud URL:"
read -r sonarcloud_url

echo "Enter the HealthChecks.io ID:"
read -r healthchecks_id

echo "Setting up project: $project_name"

# Update .wakatime and README.md
sed -i "s/TemplateProject/$project_name/g" .wakatime-project
sed -i "s/TemplateProject/$project_name/g" README.md

# Update composer.json
sed -i "s/TemplateNamespace/$namespace/g" composer.json

# Update Healthchecks.io badge
echo "Please create a HealthChecks.io account if needed."
sed -i "s/HealthChecksId/$healthchecks_id/g" README.md

# Update SonarCloud URL
sed -i "s|SonarCloudUrl|$sonarcloud_url|g" README.md

# Run composer install
echo "Running composer install..."
composer install

echo "Project setup complete."

# Additional PHP setup tasks
echo "Performing additional PHP setup tasks..."
# Add any additional setup commands here

echo "Setup finished successfully."



Requirements: 
- Azure Resource Manager 
- azure-cli version 2.37.0 or later
  - (Windows): `az -v` (I usaed 2.57.0)

Environment

```bash
az -v > devenv.log
```

Open a new Terminal window (Bash): 

```bash
az login > login.json
```

A web browser will be opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. Please continue the login in the web browser. If no web browser is available or if the web browser fails to open, use device code flow with `az login --use-device-code`.

I stash the response from logging in into a json file for reference. 

ARM Template

```bash
touch azuredeploy.json

cat > azuredeploy.json << EOF
{
  "\$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": []
}
EOF

```

List azure locations: 
```bash
az account list-locations --query "[].{DisplayName:displayName, Name:name}" -o table
```


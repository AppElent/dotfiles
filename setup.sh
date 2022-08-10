#!/bin/bash

# Install Terraform
sudo apt update && sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform

# Configure terraform
# Create .terraformrc with credential config for user
cat >~/.terraformrc <<EOL
credentials "app.terraform.io" {
  token = "${TFE_TOKEN}"
}
EOL
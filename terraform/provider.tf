# Explicit declaration of dependency on more providers.
# Their configuration is being passed from the main module.
terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}
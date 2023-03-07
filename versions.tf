terraform {
  required_version = ">= 1.3.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.41.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.3.6"
    }
  }
}

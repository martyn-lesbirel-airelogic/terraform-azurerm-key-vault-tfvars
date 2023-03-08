# terraform-azurerm-key-vault-tfvars

[![Terraform CI](./actions/workflows/continuous-integration-terraform.yml/badge.svg?branch=main)](./actions/workflows/continuous-integration-terraform.yml?branch=main)
[![GitHub release](./releases)](./releases)

This module creates and manages an Azure Key Vault and stores your Terraform variable files as Secrets within it.

## Usage

Example module usage:

```hcl
module "azure_key_vault_tfvars" {
  source = "github.com/DFE-Digital/terraform-azurerm-key-vault-tfvars?ref=v0.1.0"

  environment         = "Dev"
  project_name        = "myproject"
  resource_group_name = "my-rg-name"
  azure_location      = "uk-south"

  key_vault_access_users = [
    "my_email.address.suffix#EXT#@platformidentity.onmicrosoft.com",
  ]

  tfvars_filename = "dev.tfvars"

  tags = {
    "My Tag" = "My Value!"
  }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.3.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.36.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.46.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.tfvars](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.tfvars](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azuread_user.key_vault_access](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | Azure location in which to launch resources. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name. Will be used along with `project_name` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_key_vault_access_users"></a> [key\_vault\_access\_users](#input\_key\_vault\_access\_users) | List of users that require access to the Key Vault where tfvars are stored. This should be a list of User Principle Names (Found in Active Directory) that need to run terraform | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name. Will be used along with `environment` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of an existing Resource Group to create the Key Vault within | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_tfvars_filename"></a> [tfvars\_filename](#input\_tfvars\_filename) | tfvars filename. This file is uploaded and stored encrupted within Key Vault, to ensure that the latest tfvars are stored in a shared place. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

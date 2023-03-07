locals {
  environment            = var.environment
  project_name           = var.project_name
  resource_group_name    = var.resource_group_name
  azure_location         = var.azure_location
  resource_prefix        = "${local.environment}${local.project_name}"
  key_vault_access_users = toset(var.key_vault_access_users)
  tfvars_filename        = var.tfvars_filename
  tags                   = var.tags
}

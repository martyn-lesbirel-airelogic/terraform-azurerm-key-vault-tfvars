locals {
  environment                           = var.environment
  project_name                          = var.project_name
  existing_resource_group               = var.existing_resource_group
  azure_location                        = var.azure_location
  resource_prefix                       = "${local.environment}${local.project_name}"
  resource_group                        = local.existing_resource_group == "" ? azurerm_resource_group.default[0] : data.azurerm_resource_group.existing_resource_group[0]
  enable_resource_group_lock            = var.enable_resource_group_lock
  key_vault_access_users                = toset(var.key_vault_access_users)
  key_vault_access_ipv4                 = var.key_vault_access_ipv4
  key_vault_access_subnet_ids           = var.key_vault_access_subnet_ids
  tfvars_filename                       = var.tfvars_filename
  enable_diagnostic_setting             = var.enable_diagnostic_setting
  enable_diagnostic_retention_policy    = var.enable_diagnostic_retention_policy
  diagnostic_retention_days             = var.diagnostic_retention_days
  diagnostic_log_analytics_workspace_id = var.diagnostic_log_analytics_workspace_id != "" ? var.diagnostic_log_analytics_workspace_id : null
  log_analytics_destination_type        = var.diagnostic_log_analytics_workspace_id != "" ? "Dedicated" : null
  diagnostic_storage_account_id         = var.diagnostic_storage_account_id != "" ? var.diagnostic_storage_account_id : null
  diagnostic_eventhub_name              = var.diagnostic_eventhub_name != "" ? var.diagnostic_eventhub_name : null
  tags                                  = var.tags
}

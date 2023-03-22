locals {
  environment                           = var.environment
  project_name                          = var.project_name
  resource_group_name                   = var.resource_group_name
  azure_location                        = var.azure_location
  resource_prefix                       = "${local.environment}${local.project_name}"
  key_vault_access_users                = toset(var.key_vault_access_users)
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

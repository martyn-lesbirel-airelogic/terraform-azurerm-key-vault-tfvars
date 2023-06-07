resource "azurerm_monitor_diagnostic_setting" "tfvars" {
  count = local.enable_diagnostic_setting ? 1 : 0

  name               = "${local.resource_prefix}-tfvars-diag"
  target_resource_id = azurerm_key_vault.tfvars.id

  log_analytics_workspace_id     = local.diagnostic_log_analytics_workspace_id
  log_analytics_destination_type = local.log_analytics_destination_type

  eventhub_name = local.diagnostic_eventhub_name

  storage_account_id = local.diagnostic_storage_account_id

  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = local.enable_diagnostic_retention_policy
      days    = local.diagnostic_retention_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = local.enable_diagnostic_retention_policy
      days    = local.diagnostic_retention_days
    }
  }
}

resource "azurerm_storage_account" "logs" {
  count = local.enable_diagnostic_storage_account ? 1 : 0

  name                      = "${replace(local.resource_prefix, "-", "")}tfvarslogs"
  resource_group_name       = local.resource_group.name
  location                  = local.resource_group.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true

  tags = local.tags
}

resource "azurerm_log_analytics_workspace" "key_vault" {
  count = local.enable_log_analytics_workspace ? 1 : 0

  name                = "${local.resource_prefix}tfvarskeyvault"
  resource_group_name = local.resource_group.name
  location            = local.resource_group.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

# main.tf
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id # Your Azure Tenant ID
  sku_name                    = "standard"    # CRITICAL: Ensures the lowest cost (software keys)

  # Recommended settings for basic use
  soft_delete_retention_days  = 7             # The minimum is 7 days
  purge_protection_enabled    = false         # False to avoid a higher cost commitment
}




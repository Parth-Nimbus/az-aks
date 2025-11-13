# main.tf
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"             # Standard tier is required for the free limits
  account_replication_type = "LRS"                  # CRITICAL: Locally-Redundant Storage (LRS) is the lowest cost option and typically the only one eligible for the Always Free limit.
  account_kind             = "StorageV2"            # General Purpose V2 is the recommended kind
    #   # Set minimum security/retention policies to reduce potential costs
    #   min_tls_version          = "TLS1_2" --> is this the default?
    #   enable_https_traffic_only = true --> this is the default
}

resource "azurerm_storage_container" "blob_container" {
  name                  = "free-storage-container"
  storage_account_id = azurerm_storage_account.sa.id
  container_access_type = "private"
}


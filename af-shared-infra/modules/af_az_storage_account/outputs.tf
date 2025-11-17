output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "The name of the created Storage Account."
}

output "storage_account_id" {
  value       = azurerm_storage_account.sa.id
  description = "The ID of the created Storage Account."
}

output "storage_account_location" {
  description = "The Azure region where the storage account is deployed."
  value       = azurerm_storage_account.sa.location
}
# --- Root Variables ---
variable "resource_prefix" {
  description = "A prefix for naming resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the main resource group."
  type        = string
}
variable "location" {
  description = "The Azure region (e.g., eastus)."
  type        = string
}
variable "tenant_id" {
  description = "Your Azure Active Directory Tenant ID."
  type        = string
}
variable "key_vault_name" {
  description = "Globally unique name for the Key Vault."
  type        = string
}
variable "storage_account_name" {
  description = "Globally unique name for the Storage Account."
  type        = string
}
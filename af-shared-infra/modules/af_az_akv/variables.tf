# variables.tf
variable "key_vault_name" {
  description = "Globally unique name for the Key Vault."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group to deploy into."
  type        = string
}
variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}
variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}
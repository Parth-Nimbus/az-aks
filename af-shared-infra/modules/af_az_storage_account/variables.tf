# variables.tf
variable "storage_account_name" {
  description = "Globally unique name for the Storage Account (must be lowercase letters and numbers, 3-24 characters)."
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
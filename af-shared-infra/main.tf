# main.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Module Definitions ---

module "resource_group" {
  source = "./resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "key_vault" {
  source = "./key_vault"

  key_vault_name      = var.key_vault_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  tenant_id           = var.tenant_id
}

module "storage_account" {
  source = "./storage_account"

  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.location
}


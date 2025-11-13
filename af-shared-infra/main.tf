# main.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Module Definitions ---

module "resource_group" {
  source = "./resource_group"

  resource_group_name = "${var.resource_prefix}_${var.resource_group_name}_${terraform.workspace}"
  location            = var.location
}

module "key_vault" {
  source = "./key_vault"

  key_vault_name      = var.key_vault_name
  resource_group_name = "${var.resource_prefix}_${var.key_vault_name}_${terraform.workspace}"
  location            = module.resource_group.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  # tenant_id           = var.tenant_id
}

module "storage_account" {
  source = "./storage_account"

  storage_account_name = "${var.resource_prefix}_${var.storage_account_name}_${terraform.workspace}"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.location
}


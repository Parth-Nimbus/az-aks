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

data "azurerm_client_config" "current" {}

# --- Module Definitions ---

module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = "${var.resource_prefix}-${var.resource_group_name}-${terraform.workspace}"
  resource_group_location = var.location
}

module "key_vault" {
  source = "./modules/af_az_akv"

  key_vault_name      = "${var.resource_prefix}-${var.key_vault_name}-${terraform.workspace}"
  resource_group_name = "${var.resource_prefix}-${var.resource_group_name}-${terraform.workspace}"
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  # tenant_id           = var.tenant_id
}

module "storage_account" {
  source = "./modules/af_az_storage_account"

  storage_account_name = replace("${var.resource_prefix}-${var.storage_account_name}-${terraform.workspace}", "-", "")  
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
}


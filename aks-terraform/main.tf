terraform {
  required_version = ">= 1.1.1"

  # backend "azurerm" {
  #   storage_account_name = "wjecommterraformprod"
  #   container_name       = "tfstate"
  #   key                  = "aks.tfstate"
  # }
  backend "local" {
path = "state/terraform.tfstate"
}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0"
    }
  }
}
data "azurerm_client_config" "current" {}

module "az_service_principal" {
  source   = "./modules/az_service_principal"
  sp_name  = var.sp_name
}

module "resource_group" {
  source                  = "./modules/resource_group"
  resource_group_name     = var.resource_group_name
  resource_group_location  = var.resource_group_location
  tags          = {
    environment = "production"
    owner       = "platform-team"
  }
}

module "az_keyvault" {
  source              = "./modules/az_keyvault"
  kv_name             = var.kv_name
  location            = var.resource_group_location
  resource_group_name = module.resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = module.service_principal.sp_object_id
}

module "aks" {
  source                  = "./modules/aks"
  cluster_name            = var.cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  node_count              = var.node_count
  vm_size                 = var.vm_size
  client_id               = module.service_principal.client_id
  client_secret           = module.service_principal.client_secret
  kubernetes_version      = var.kubernetes_version
  admin_group_object_id   = var.admin_group_object_id
}

resource "kubernetes_namespace" "ns" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.key
  }
}

module "az_aks_rbac" {
  source              = "./modules/az_aks_rbac"
  namespaces          = ["dev", "prd"]
  azure_ad_group_name = var.azure_ad_group_name
}
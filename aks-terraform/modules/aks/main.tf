# Get the security groups for the cluster
# locals {
#   all_security_group_ids = values(module.aad_security_groups.security_group_ids)
# }

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  # service_principal {
  #   client_id     = var.client_id
  #   client_secret = var.client_secret
  # }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    admin_group_object_ids = values(var.all_security_group_ids)
  }

  kubernetes_version = var.kubernetes_version
}
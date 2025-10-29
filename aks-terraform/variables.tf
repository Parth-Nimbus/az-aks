variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "aks-rg"
}

variable "sp_name" {
  default = "aks-service-principal"
}

variable "kv_name" {
  default = "aksKeyVault123"
}

variable "cluster_name" {
  default = "aks-cluster"
}

variable "dns_prefix" {
  default = "aksdns"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_DS2_v2"
}

variable "kubernetes_version" {
  default = "1.28.3"
}

variable "admin_group_object_id" {
  description = "Azure AD group object ID for AKS admin access"
}

variable "azure_ad_group_name" {
  description = "Azure AD group name for RBAC binding"
}

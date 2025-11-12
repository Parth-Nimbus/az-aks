variable "resource_group_location" {
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
  default = 1
}

variable "vm_size" {
  default = "Standard_DS2_v2"
}

# variable "admin_group_object_ids" {
#   description = "List of security groups to create"
#   type = list(object({
#     name        = string
#     description = string
#   }))
# }

variable "kubernetes_version" {
  default = "1.28.3"
}

# variable "azure_ad_group_name" {
#   description = "Azure AD group name for RBAC binding"
# }

variable "namespaces" {
  type        = list(string)
  description = "List of Kubernetes namespaces to create"
}

variable "enable_azure_policy" {
  type    = bool
  default = true
}

variable "security_groups" {
  description = "List of security groups to create"
  type = list(object({
    name        = string
    description = string
  }))
}

# variable "all_security_group_ids" {
#   description = "List of security groups ids created"
#   type = list(object({
#     name        = string
#     description = string
#   }))
# }
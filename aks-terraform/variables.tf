variable "resource_group_location" {
  default = "canadaeast"
}

variable "resource_group_name" {
  default = "rg"
}

variable "sp_name" {
  default = "aks-service-principal"
}

variable "resource_prefix" {
  description = "A prefix for naming resources."
  type        = string
}

# variable "kv_name" {
#   default = "aksKeyVault123"
# }

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

variable "kubernetes_version" {
  default = "1.33.5"
}

variable "security_groups" {
  description = "List of security groups to create"
  type = list(object({
    name        = string
    description = string
  }))
}
variable "namespaces" {
  type        = list(string)
  description = "List of Kubernetes namespaces to create"
}

variable "enable_azure_policy" {
  type    = bool
  default = true
}

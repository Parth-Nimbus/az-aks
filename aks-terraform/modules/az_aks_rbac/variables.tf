variable "namespaces" {
  type = list(string)
}

variable "devops_ad_group_name" {
  description = "Azure AD group name to bind to the role"
  type        = string
}

variable "all_security_group_ids" {
  description = "Map of security group names and IDs"
}
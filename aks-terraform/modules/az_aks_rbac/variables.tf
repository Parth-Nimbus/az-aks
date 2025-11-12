variable "namespaces" {
  type = list(string)
}

# variable "azure_ad_group_name" {
#   description = "Azure AD group name to bind to the role"
#   type        = string
# }

variable "all_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
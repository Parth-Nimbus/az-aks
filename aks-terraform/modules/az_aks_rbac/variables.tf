variable "namespaces" {
  type = list(string)
}

variable "azure_ad_group_name" {
  description = "Azure AD group name to bind to the role"
  type        = string
}
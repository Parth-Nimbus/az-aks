variable "aad_security_groups" {
  description = "List of security groups to create"
  type = list(object({
    name        = string
    description = string
  }))
}

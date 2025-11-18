output "security_group_ids" {
  description = "Map of security group names to their object IDs"
  value = {
    for name, group in azuread_group.this :
    name => regex("[0-9a-fA-F-]{36}$", group.id)
  }
}

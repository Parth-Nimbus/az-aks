resource "azuread_group" "this" {
  for_each = { for sg in var.security_groups : sg.name => sg }

  display_name     = each.value.name
  description      = each.value.description
  security_enabled = true
  mail_enabled     = false
  visibility       = "Private"
}

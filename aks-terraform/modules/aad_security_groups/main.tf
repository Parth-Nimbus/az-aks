# resource "azuread_group" "this" {
#   for_each = { for sg in var.aad_security_groups : sg.name => sg }

#   display_name     = each.value.name
#   description      = each.value.description
#   security_enabled = true
#   mail_enabled     = false
#   visibility       = "Private"
# }

resource "azuread_group" "this" {
  for_each = { for sg in var.aad_security_groups : sg.name => sg }

  display_name     = each.key
  description      = each.value.description
  security_enabled = true
  mail_enabled     = false
  visibility       = "Private"
}
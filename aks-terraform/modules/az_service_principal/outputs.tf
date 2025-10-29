output "client_id" {
  value = azuread_application.app.application_id
}

output "client_secret" {
  value = azuread_service_principal_password.sp_password.value
}

output "sp_object_id" {
  value = azuread_service_principal.sp.object_id
}
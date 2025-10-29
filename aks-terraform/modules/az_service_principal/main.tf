resource "azuread_application" "app" {
  display_name = var.sp_name
}

resource "azuread_service_principal" "sp" {
  application_id = azuread_application.app.application_id
}

resource "azuread_service_principal_password" "sp_password" {
  service_principal_id = azuread_service_principal.sp.id
  value                = "SuperSecurePassword123!"
  end_date             = "2099-01-01T00:00:00Z"
}
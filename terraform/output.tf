output "app_service_name" {
  value = azurerm_app_service.main.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.main.default_site_hostname}"
}

output "acr_login" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  sensitive = true
  value = azurerm_container_registry.acr.admin_password
}
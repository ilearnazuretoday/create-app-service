output "app_service_name" {
  value = azurerm_app_service.main.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.main.default_site_hostname}"
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "resource_group" {
    value = azurerm_resource_group.main.name
}
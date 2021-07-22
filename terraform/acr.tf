resource "azurerm_container_registry" "acr" {
  name                = "${var.project_abbrev}acr${local.region_abbrev}${local.environment_abbrev}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    ManagedBy       = "Learning azure PaaS"
    ProvisionedWith = "Terraform"
  }
}
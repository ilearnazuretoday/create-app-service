resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_abbrev}-${local.region_abbrev}-${local.environment_abbrev}"
  location = var.location
}
resource "azurerm_app_service_plan" "main" {
  name                = "${var.project_abbrev}-apsp-${local.region_abbrev}-${local.environment_abbrev}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B2"
  }
  tags = {
    ManagedBy       = "Learning Azure PaaS"
    ProvisionedWith = "Terraform"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.project_abbrev}-appservice-${local.region_abbrev}-${local.environment_abbrev}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id
  https_only          = true

  site_config {
    always_on        = true
    app_command_line = ""
    linux_fx_version = "DOCKER|appsvcsample/python-helloworld:latest" # will be overwritten once image is pushed

    cors {
      allowed_origins = ["*"]
    }
  }

  lifecycle {
    ignore_changes = [
      site_config[0].linux_fx_version, # deployments are made outside of Terraform
    ]
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://${azurerm_container_registry.acr.login_server}" # url doesn't have https
    "DOCKER_REGISTRY_SERVER_USERNAME"     = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = azurerm_container_registry.acr.admin_password
  }
  tags = {
    ManagedBy       = "Learning Azure PaaS"
    ProvisionedWith = "Terraform"
  }
}
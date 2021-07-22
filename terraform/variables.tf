variable "location" {
  default     = "westeurope"
  description = "The Azure location where all resources in this example should be created"
}

variable "environment" {
  default     = "dev"
  type        = string
  description = "Name of the environment"
}

variable "project_abbrev" {
  default     = "learn-paas"
  type        = string
  description = "Short name of the project"
}

locals {
  region_abbrev           = lookup({ eastus = "eus", westeurope = "weu" }, var.location, "weu")
  environment_abbrev      = lower(substr(var.environment, 0, 1)) # first letter of environment
  environment_abbrev_long = lookup({ development = "dev" }, lower(var.environment), "dev")
}
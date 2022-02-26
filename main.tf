# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}

terraform {
  backend "azurerm"  {
    resource_group_name = "tf_rg_storage"
    storage_account_name = "tfstorageweatherapi"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

#
variable "imagebuild" {
  type = string 
  description = "Latest Image Build"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "tf_test" {
  name     = "tfmainrg"
  location = "West US"
}

# 
resource "azurerm_container_group" "tfcg_test" {
  name = "weatherapi"
  location = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name
  ip_address_type = "public"
  dns_name_label = "luisenalvarweatherapi"
  os_type = "Linux"

  container {
    name = "weatherapi"
    image = "luisenalvar/weatherapi:${var.imagebuild}"
    cpu = "1.0"
    memory = "1.0"
    ports {
      port = 80
      protocol = "TCP"
    }
  }
}

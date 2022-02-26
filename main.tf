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
    image = "luisenalvar/weatherapi"
    cpu = "1.0"
    memory = "1.0"
    ports {
      port = 80
      protocol = "TCP"
    }
  }
}

#I stopped the container on Azure, 59:04 on video


#setx ARM_CLIENT_ID [];
#setx ARM_CLIENT_SECRET [];
#setx ARM_TENANT_ID [];
#setx ARM_SUBSCRIPTION_ID [];

#TerraformServiceP{rincpleforCICD is being added as Contributor for luisenalvar-pay-as-you-go. 
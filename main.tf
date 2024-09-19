provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
}

data "azurerm_resource_group" "existing" {
  name = "1-4c963af4-playground-sandbox"
}


#resource "azurerm_resource_group" "rg" {
#  name     = "1-bda8d5f3-playground-sandbox"
#  location = "East US"
#}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  vnet_name           = "my-vnet"
  address_space       = ["10.0.0.0/16"]
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  vnet_name           = module.vnet.vnet_name
  subnet_id           = module.vnet.subnet_id
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  storage_account_name = "mystorageacct"
}



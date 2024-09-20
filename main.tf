terraform {
  backend "azurerm" {
    storage_account_name = "tfstorageterraform1"  # Your storage account name
    container_name       = "tfstate"               # Your container name
    key                  = "terraform.tfstate"     # The name of your state file
    # access_key is not included here
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
}

data "azurerm_resource_group" "existing" {
  name = "1-cee7b8b7-playground-sandbox"
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



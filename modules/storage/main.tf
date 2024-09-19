resource "random_id" "storage_suffix" {
  byte_length = 4
}


resource "azurerm_storage_account" "storage" {
  name                     ="${var.storage_account_name}${random_id.storage_suffix.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "testing"
  }
}


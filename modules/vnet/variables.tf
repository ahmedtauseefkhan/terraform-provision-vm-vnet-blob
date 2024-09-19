variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region to deploy resources."
}

variable "vnet_name" {
  description = "The name of the virtual network."
}

variable "address_space" {
  description = "The address space for the virtual network."
}

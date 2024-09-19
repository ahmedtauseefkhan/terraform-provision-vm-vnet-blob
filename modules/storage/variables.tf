variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region to deploy resources."
}

variable "storage_account_name" {
  description = "The name of the storage account."
  default     = "tkxel"
}

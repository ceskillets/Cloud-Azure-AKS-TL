 #Configure the Microsoft Azure Provider
provider "azurerm" {
    version = "~>1.5"
}

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

# Creating random string for use in DNS Labels and Storage Account
resource "random_id" "randomId" {
  keepers = {
      # Generate a new ID only when a new resource group is defined
      resource_group = "${var.resource_group_name}"
  }
  byte_length = 4
}
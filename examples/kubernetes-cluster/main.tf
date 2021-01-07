provider "azurerm" {
  features {}
}

#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  name_strings   = ["byt", "rsg", "aks"]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "container_registry" {
  source = "../../"

  name_strings        = ["byt", "aks", "001"]
  resource_group_name = module.resourcegroup.resource_group_name
  location            = "west europe"

  depends_on = [
    module.resourcegroup
  ]

  tags = {
    Environment = "Development"
  }
}

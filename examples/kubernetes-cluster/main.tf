provider "azurerm" {
  features {}
}

#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  location       = "west europe"
  name_strings   = ["byt", "rsg", "aks"]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "kubernetes-cluster" {
  source = "../../"

  name_strings        = ["byt", "aks", "001"]
  resource_group_name = module.resourcegroup.resource_group_name
  location            = "west europe"

  depends_on = [
    module.resourcegroup
  ]

  private_cluster_enabled = "true"

  tags = {
    Environment = "Development"
  }
}

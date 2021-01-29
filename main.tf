resource "azurerm_kubernetes_cluster" "main" {
  name                = join(var.name_separator, var.name_strings)
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix              = join(var.name_separator, var.name_strings)
  private_cluster_enabled = var.private_cluster_enabled


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge({
    Module-Name = "azure kubernetes cluster"
    Author      = "bytejunkie - matt@bytejunkie.dev"
    },
    var.tags
  )

}

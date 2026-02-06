resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location   

}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix         = "aks-cluster-terraform"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_b2s_v2"
  }

identity {
  type = "SystemAssigned"
  }
}

resource "azurerm_log_analytics_workspace" "log" {
  name                = "devops-logs"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
}
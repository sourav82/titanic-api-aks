resource "azurerm_container_registry" "titanic-apis" {
  name                = "titanicacr"
  resource_group_name = var.rgName
  location            = var.location
  sku                 = "Premium"
}

resource "azurerm_kubernetes_cluster" "titanic-apis" {
  name                = "titanicapis-aks"
  location            = var.location
  resource_group_name = var.rgName
  dns_prefix          = "titanicapis-k8s"

  default_node_pool {
    name            = "titanicpool"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }


  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}
resource "azurerm_role_assignment" "titanic-apis" {
  principal_id                     = var.appId
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.titanic-apis.id
  skip_service_principal_aad_check = true
}
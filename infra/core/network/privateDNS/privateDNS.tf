resource "azurerm_private_dns_zone" "pr_dns_zone" {
  name                = var.name
  resource_group_name = var.resourceGroupName
  tags                = var.tags
}

data "azurerm_virtual_network" "vnet" {
  name = var.virtual_network_name
  resource_group_name = var.resourceGroupName
}

resource "azurerm_private_dns_zone_virtual_network_link" "pr_dns_vnet_link" {
  name                  = var.vnetLinkName
  resource_group_name   = var.resourceGroupName
  private_dns_zone_name = azurerm_private_dns_zone.pr_dns_zone.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
  tags                  = var.tags
}

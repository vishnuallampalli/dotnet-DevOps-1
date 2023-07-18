
resource "azurerm_public_ip" "example" {
  name                = "${var.vm_name}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "example" {
  name                      = "${var.vm_name}-nic"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  //network_security_group_id = azurerm_network_security_group.example.id
  ip_configuration {
    name                          = "config"
    subnet_id                     = var.subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
  
}
resource "azurerm_network_security_group" "example" {
  name                = "${var.vm_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
security_rule {
  name                        = "Allow_All"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
 
}
}
output "nic" {

  value = azurerm_network_interface.example.id
  depends_on = [ azurerm_network_interface.example ]
  
}
resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = var.network_interface_ids

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file("~/.ssh/id_rsa.pub")

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.sku
    version   = "latest"
  }

  tags = {

    name= var.vmtag
  }

}

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = var.instance_name
#   resource_group_name =var.resource_group_name
#   location            =var.location
#   size                = var.size
#   admin_username      = var.adminuser
#   network_interface_ids = [
#     azurerm_network_interface.master-nw-interface.id,
#   ]


#   admin_ssh_key {
#     username   = var.user
#     public_key = file("~/.ssh/id_rsa.pub")

#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = var.sku
#     version   = "latest"
#   }
# }

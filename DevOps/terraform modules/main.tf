terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
   backend "azurerm" {} 
}

provider "azurerm" {
  skip_provider_registration = true
  features {

  }
}

module "vnet" {
  source = "./Modules/network"
  vnet = "dev"
  subnet = "dev-subnet"
    resource_group_name = "POC"
    location =  "UK South"
}
module "Master-net" {
  source              = "./Modules/networking"
  resource_group_name = "POC"
  location            = "UK South"
  vm_name = "Master-vm"
subnet = module.vnet.subnet
}
module "masterVM" {
  source              = "./Modules/vm"
  admin_username      = "ubuntu"
  location            = "UK South"
  resource_group_name = "POC"
  vm_name             = "Master-vm"
  vm_size             = "Standard_DS2_v2"
  sku                 = "18.04-LTS"
  network_interface_ids = [ module.Master-net.nic ]
  vmtag = "master"

}
module "worker-net" {
  source              = "./Modules/networking"
  resource_group_name = "POC"
  location            = "UK South"
  vm_name = "Worker-vm"
subnet = module.vnet.subnet
}

module "workerVM" {
  source              = "./Modules/vm"
  admin_username      = "ubuntu"
  location            = "UK South"
  resource_group_name = "POC"
  vm_name             = "Worker-vm"
  vm_size             = "Standard_DS2_v2"
  sku                 = "18.04-LTS"
  network_interface_ids = [ module.worker-net.nic ]
   vmtag = "worker"

}
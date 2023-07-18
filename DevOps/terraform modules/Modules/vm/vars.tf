variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the VM will be provisioned."
  type        = string


}

variable "location" {
  description = "Azure region where the VM will be deployed."
  type        = string


}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS2_v2"

}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
  default     = "ubuntu"

}


variable "sku" {
  description = "sku for the virtual machine"
  type        = string
  default     = "18.04-LTS"
}


variable "network_interface_ids" {
  description = "IDs of the network interfaces to attach to the virtual machine"
  type        = list(string)
}


variable "vmtag" {
  description = "vm tag name"
  type        = string
}

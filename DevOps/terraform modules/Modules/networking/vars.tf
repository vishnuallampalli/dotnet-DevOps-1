variable "resource_group_name" {
  description = "Name of the resource group where the VM will be provisioned."
  type        = string


}

variable "location" {
  description = "Azure region where the VM will be deployed."
  type        = string


}
variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "subnet" {
  description = "Name of the virtual machine."
  type        = string
}
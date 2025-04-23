variable "name" {
  description = "The name of the network security group"
  type        = string
}

variable "location" {
  description = "The location where the network security group will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the network security group will be created"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the network security group"
  type        = map(string)
  default     = {}
}

variable "security_rules" {
  description = "A list of security rules to be added to the network security group"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the network security group"
  type        = string
}

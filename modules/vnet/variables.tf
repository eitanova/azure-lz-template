variable "name" {
  description = "vnet name"
  type        = string

  default = ""
}
variable "address_space" {
  description = "address space that been used for this vnet"
  type        = list(string)
  default     = []
}
variable "location" {
  description = "location for network resources"
  type        = string
  default     = ""
}
variable "parent_resource_group" {
  description = "on which rg the network resources will be created"
  type        = string

  default = ""
}
variable "tags" {
  description = "key values tag to vnet"
  type        = map(string)
  default     = {}
}
variable "subnets" {
  description = "subnets"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {}
}
variable "outbound_access" {
  description = "default outbound access to the internet"
  type        = bool
  default     = false
}
variable "peering" {
  description = "peering configuration"
  type = map(object({
    target_id             = string
    allow_gateway_transit = optional(bool, false)
  }))
  default = {}
}
variable "create" {
  description = "create a vnet"
  type        = bool
  default     = true
}
